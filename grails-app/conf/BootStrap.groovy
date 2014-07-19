import groovy.json.JsonSlurper
import tour.Team

import javax.servlet.ServletContext

class BootStrap {

    def init = { ServletContext servletContext ->
        if(!Team.count()) {
            println   servletContext.getResource('/WEB-INF/resources/tourData.json').file
            importTeamData(servletContext.getResourceAsStream('/WEB-INF/resources/tourData.json'))
        }
    }

    void importTeamData(InputStream tourData) {
        def json = new JsonSlurper().parse(tourData)
        json.teams.each { Map team ->

            println "Creating team: $team.name with ${team.riders.size()} riders"
            def newTeam = new Team(name: team.name, description: team.description);
            team.riders.each { Map rider ->
                newTeam.addToRiders(rider)
            }
            newTeam.save(failOnError: true)
        }

    }
    def destroy = {
    }
}
