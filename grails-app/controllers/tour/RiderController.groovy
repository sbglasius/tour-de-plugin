package tour

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN"])
class RiderController {
    static scaffold = true
}
