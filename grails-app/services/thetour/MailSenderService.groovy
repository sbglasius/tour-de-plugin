package thetour

import grails.transaction.Transactional

@Transactional
class MailSenderService {
    def mailService

    boolean sendMailToUser() {
        try {
            mailService.sendMail {
                to "demo@glasius.dk"
                subject "Hello Søren. Here's a text message from a service"
                body 'How are you?'
            }
        } catch (e) {
            log.error "Failed to send mail",e
            return false
        }
        return true

    }
}
