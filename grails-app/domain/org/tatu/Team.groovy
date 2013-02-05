package org.tatu

class Team {
	
	String name

    static constraints = {
		name blank: false, maxSize: 40
    }
	
	@Override
	String toString() {
	  name
	}
}
