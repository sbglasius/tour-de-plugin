package thetour



class MailerJob {
    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute() {
        println "Executing job"
    }
}
