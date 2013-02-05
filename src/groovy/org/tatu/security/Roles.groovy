package org.tatu.security

public enum Roles implements org.springframework.context.MessageSourceResolvable {
	  ROLE_ADMIN,
      ROLE_USER

	  static list() {
	    [ROLE_ADMIN, ROLE_USER]
	  }

	  @Override
	  Object[] getArguments() { [] as Object[] }

	  @Override
	  String[] getCodes() {
	      ["${getClass().name}.${name()}"] as String[]
	  }

	  @Override
	  String getDefaultMessage() { name() }
	}