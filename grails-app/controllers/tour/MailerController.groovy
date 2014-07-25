package tour

class MailerController {
    def grailsApplication

    def index() {
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


}
