package tour

import com.icegreen.greenmail.util.GreenMailUtil
import grails.test.spock.IntegrationSpec

import javax.mail.Message

class MailSenderServiceIntegrationSpec extends IntegrationSpec {
    def mailSenderService

    def greenMail

    def "check content sent to SMTP server"() {
        when: "sending a message to the mailService"
        def status = mailSenderService.sendMailToUser()

        and: "the greenmail message service has processed the messages"
        def messages = greenMail.messages

        then: "The status is true"
        status == true

        and: "The number of messages sent out is one"
        messages.size() == 1

        and: "That message has the correct content"
        def message = messages.first()

        "demo@glasius.dk" == GreenMailUtil.getAddressList(message.getRecipients(Message.RecipientType.TO))
        "Hello Søren. Here's a text message from a service" == message.subject
        "How are you?" == GreenMailUtil.getBody(message)
    }
}
