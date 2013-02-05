import org.tatu.Role
import org.tatu.security.Roles

class BootStrap {
	

    def init = { servletContext ->
		
		if (!Role.findByAuthority(Roles.ROLE_ADMIN.name())) {
			def r = new Role([authority: Roles.ROLE_ADMIN.name()])
			r.save(flush: true, failOnError:true)
		}
		
		if (!Role.findByAuthority(Roles.ROLE_USER.name())) {
			def r = new Role([authority: Roles.ROLE_USER.name()])
			r.save(flush: true, failOnError:true)
		}
    }

    def destroy = {
    }
}
