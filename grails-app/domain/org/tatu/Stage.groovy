package org.tatu

class Stage {
	
	String name
    Date startingDate = new Date()

    List matches

	static hasMany = [matches: Match]
    static belongsTo = [tournament:Tournament]
	
    static constraints = {
    }

    @Override
    String toString() {
        name + ' - ' + tournament?.name
    }

    static transients = ['finished', 'closed']

    boolean isFinished() {
       Match.countByStage(this) == Match.countByStageAndFinished(this, true)
    }

}
