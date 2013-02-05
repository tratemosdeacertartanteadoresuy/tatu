package org.tatu

class Match {
	
	Team home
	Team visitor
    
	int homeScore 
	int visitorScore

    static belongsTo = [stage: Stage]
	
	boolean finished = false
	
	
    static constraints = {

    }

    static mapping = {
        sort 'stage.name': 'asc'
    }

    @Override
    String toString() {
        if (home && visitor) {
            return home.name + ' - ' + visitor.name
        } else {
            return ''
        }
    }
}
