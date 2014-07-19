@Grab(group = 'net.sourceforge.nekohtml', module = 'nekohtml', version = '1.9.14')
import groovy.json.*


Map extractTeam(team) {
    url = team.toURL().getText('UTF-8')

    def parser = new org.cyberneko.html.parsers.SAXParser()
    parser.setFeature("http://cyberneko.org/html/features/balance-tags/document-fragment", true)
    parser.setProperty("http://cyberneko.org/html/properties/names/elems", "lower");

    xml = new XmlSlurper(parser).parseText("<html><body>$url</body></html>")

    teamDescriptionXml = xml.body.'*'.find { it.@class == 'content' }.'*'.find {
        it.@class == 'tab-description'
    }.'*'.collect()

    name = teamDescriptionXml[1].text()

    description = teamDescriptionXml[3..-1].takeWhile { it.children().isEmpty() }.collect { it.text() }.join('<br/>')


    teamRidersXml = xml.body.'*'.find { it.@class == 'content' }.'*'.find { it.@class == 'tab-coureurs' }.'*'.'*'.'*'
    teamRiders = teamRidersXml.collect {
        def rider = it.breadthFirst().collect()
        [
                name  : rider.find { it.name() == 'h4' }.text(),
                image : rider.find { it.name() == 'img' }.@src.toString(),
                weight: rider.find { it.@class == 'weight' }?.text()?.minus("kg"),
                born  : rider.find { it.@class == 'date' }.text(),
        ]
    }
    return [
            name       : name,
            description: description,
            riders     : teamRiders
    ]
}

def teams = ['alm', 'bel', 'tcs', 'mov', 'bmc', 'tfr', 'euc', 'lam', 'opq', 'ltb', 'fdj', 'cof', 'iam', 'tne', 'tcs']

def json = teams.collect {
    println "Extracting $it"
    extractTeam("http://www.letour.fr/le-tour/2014/us/equipes/${it}/main-equipe-full.html")
}

jsonWriter = new StringWriter()
builder = new StreamingJsonBuilder(jsonWriter)
builder(teams: json)

new File('/Users/sbg/projects/demos/theTour/web-app/WEB-INF/resources/tourData.json').setText(JsonOutput.prettyPrint(jsonWriter.toString()), 'UTF-8')

