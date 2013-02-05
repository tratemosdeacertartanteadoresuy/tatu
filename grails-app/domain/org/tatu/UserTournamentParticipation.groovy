package org.tatu

class UserTournamentParticipation {
    
	static belongsTo = [user: User, tournament: Tournament]

    static constraints = {
    }

    static mapping = {
        sort user: 'asc'
    }
}
