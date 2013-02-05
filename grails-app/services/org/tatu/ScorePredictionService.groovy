package org.tatu

import org.springframework.transaction.annotation.Transactional

class ScorePredictionService {


    @Transactional
    def saveScorePredictions(User u, Stage s, Map scorePredictions) {
        s.matches.each {
            def scorePrediction = ScorePrediction.findByUserAndMatch(u,it)
            if (!scorePrediction) {
                scorePrediction = new ScorePrediction()
                scorePrediction.match = it
                scorePrediction.user = u
            }
            scorePrediction.homeScore = scorePredictions[it.home.id]
            scorePrediction.visitorScore = scorePredictions[it.visitor.id]
            scorePrediction.save(flush: true, failOnError: true)
        }
    }
}
