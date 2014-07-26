package tour

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN"])
class TeamController {
    static scaffold = true
}
