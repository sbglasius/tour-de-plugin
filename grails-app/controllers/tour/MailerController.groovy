package tour

class MailerController {
    def grailsApplication

    def index() {
        println grailsApplication.config.grails.mail
    }

    def sendPlainTextMail() {
        sendMail {
            to "demo@glasius.dk"
            subject "Hello Søren. Here's a text message"
            body 'How are you?'
        }
        flash.message="Text message sent to Søren"
        redirect(action: 'index')
    }

    def sendHtmlMail() {
        sendMail {
            to "demo@glasius.dk"
            subject "Hello Søren. Here's a HTML message"
            html '<strong>Hello</strong> Søren<br/><p style="background-color: yellow">This is a HTML message</p>'
        }
        flash.message="HTML message sent to Søren"
        redirect(action: 'index')
    }
}
