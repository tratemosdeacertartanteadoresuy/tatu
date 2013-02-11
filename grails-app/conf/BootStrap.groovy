import org.tatu.Role
import org.tatu.User
import org.tatu.UserRole
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

        //Default users
        // RM
        if (!User.findByUsername('machador@gmail.com'))  {
          def u = new User(username: 'machador@gmail.com', password: 'apelooamuete', initials: 'RM')
          u.save(flush: true, failOnError: true)
        }

        if (!UserRole.findByUserAndRole(User.findByUsername('machador@gmail.com'), Role.findByAuthority(Roles.ROLE_ADMIN.name()))) {
            def ur = new UserRole(user:User.findByUsername('machador@gmail.com'), role: Role.findByAuthority(Roles.ROLE_ADMIN.name()))
            ur.save(flush: true, failOnError: true)
        }

        // ND
        if (!User.findByUsername('nikodc@gmail.com'))  {
            def u = new User(username: 'nikodc@gmail.com', password: 'apelooamuete', initials: 'ND')
            u.save(flush: true, failOnError: true)
        }

        if (!UserRole.findByUserAndRole(User.findByUsername('nikodc@gmail.com'),Role.findByAuthority(Roles.ROLE_ADMIN.name()))) {
            def ur = new UserRole(user:User.findByUsername('nikodc@gmail.com'), role: Role.findByAuthority(Roles.ROLE_ADMIN.name()))
            ur.save(flush: true, failOnError: true)
        }
    }

    def destroy = {
    }
}
