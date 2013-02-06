package org.tatu

import org.springframework.transaction.annotation.Transactional
import org.tatu.dto.UserMatchPoints

class StageService {



    @Transactional(readOnly = true)
    def getUsersTotalStagePoints(Long stageId, Long userId) {
      def predictions = ScorePrediction.findAllByStageAndUser(Stage.get(stageId), User.get(userId))

      def userPoints= []
      predictions.each{
         if (it.match.finished) {
            def points = it.points
            if (points > 0) {
               def ump = new UserMatchPoints()
               ump.matchId = it.match.id
               ump.userId = userId
               ump.points = points
               userPoints.add(ump)
            }
         }
      }
      userPoints
    }
}
