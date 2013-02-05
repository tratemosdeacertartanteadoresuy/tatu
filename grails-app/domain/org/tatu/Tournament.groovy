package org.tatu

class Tournament {
	
	String name 
	Date startingDate

    boolean active = false

    List stages
	static hasMany = [stages: Stage]
	
    static constraints = {
    }

    static mapping = {
        sort startingDate: 'desc'
    }

    @Override
    String toString() {
      name
    }

}
