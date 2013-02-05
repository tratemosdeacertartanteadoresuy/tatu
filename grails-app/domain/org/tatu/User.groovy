package org.tatu

class User {

	transient springSecurityService

	String username
	String password
	String initials
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true, email: true
		password blank: false
		initials blank: false, unique: true, maxSize: 3
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
		initials = initials.toUpperCase()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
		if (isDirty(initials)){
			initials = initials.toUpperCase()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

    @Override
    String toString() {
      initials?.toUpperCase()
    }
}
