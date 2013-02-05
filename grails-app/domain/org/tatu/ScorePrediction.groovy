package org.tatu

class ScorePrediction {
	
	static belongsTo = [match: Match, user: User, stage:Stage, tournament: Tournament]

    int homeScore
    int visitorScore

    static constraints = {
        stage nullable: true
        tournament nullable: true
    }

    def beforeInsert() {
      stage = match?.stage
      tournament = match?.stage?.tournament
    }

    def beforeUpdate() {
        stage = match?.stage
        tournament = match?.stage?.tournament
    }

    static transients = ['points']

    Integer getPoints() {
        if (!match.finished) {
            return null
        }

        int homeReal = match.homeScore
        int visitorReal = match.visitorScore

        if (homeReal == homeScore && visitorScore == visitorReal){
             return new Integer(5)
        }

        if ((homeReal == visitorReal && visitorScore == homeScore)
                || (homeReal > visitorReal && homeScore > visitorScore)
                || (homeReal < visitorReal && homeScore < visitorScore)) {
           return new Integer(3)
        }

        return new Integer(0)
    }
}
