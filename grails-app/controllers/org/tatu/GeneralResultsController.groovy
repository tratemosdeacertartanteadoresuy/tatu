package org.tatu

class GeneralResultsController {

    def stageService

    def index() {
        def stageList = []
        def userList = []
        def t = Tournament.findByActive(true)
        if (t) {
            stageList = t.stages
            userList = UserTournamentParticipation.findByTournament(((Stage)stageList.first()).tournament).collect{it.user}.sort{it.initials}
        }
        [stageList: stageList, playerResults:getPlayersResultsMap((Stage)stageList.first()), userList: userList]
    }

    def getStage() {
        def stage = Stage.get(params.id)
        render (template: 'stageResults', model: [stage: stage, results:getPlayersResultsMap(stage), userList: UserTournamentParticipation.findByTournament(stage.tournament).collect{it.user}.sort{it.initials}])
    }

    def positions () {
        def stageList = []
        def userList = []
        def t = Tournament.findByActive(true)
        if (t) {
            stageList = t.stages
            userList = UserTournamentParticipation.findByTournament(((Stage)stageList.first()).tournament).collect{it.user}.sort{it.initials}
        }
        [stageList: stageList, userList: userList]
    }

    // Private Methods
    private Map getPlayersResultsMap(Stage stage) {
        def mapUserData = [:]
        def userParticipationList = UserTournamentParticipation.findByTournament(stage.tournament)
        def stageTotalMax = 0
        def stageTotalMaxQuantity = 0
        userParticipationList.each { participation ->
            def resultList = ScorePrediction.findAllByUserAndStage(participation.user,stage)
            def userId = participation.user.id
            def dataMap = [:]
            stage.matches.each {
                //Default values just to complete grid *there may be users with no complete ScorePredictions
                dataMap[it.id] = [-1,-1,-1]
            }
            def stageUserTotal = 0
            resultList.each { scorePred ->
                dataMap[scorePred.match.id] = [new Integer(scorePred.homeScore),new Integer(scorePred.visitorScore), scorePred.points]
                stageUserTotal= stageUserTotal + (scorePred.points?:0)
            }
            // dataMap.TOTAL = [Stage Total, Stage Bonus]
            dataMap.TOTAL = [stageUserTotal,0]
            mapUserData[userId] = dataMap
            if (stageTotalMax < stageUserTotal) {
                stageTotalMaxQuantity = 1;
                stageUserTotal = 1
            } else if (stageTotalMax == stageUserTotal) {
                stageUserTotal++
            }
        }

        if (stage.finished && stageTotalMax) {
            def bonus = 4
            if (stageUserTotal > 2) {
                bonus = 1
            } else if (stageUserTotal == 2) {
                bonus = 2
            }
            mapUserData.each {key, value ->
               if (value.TOTAL[0] == stageTotalMax) {
                   value.TOTAL[1] = bonus
               }
            }
        }

        mapUserData
    }

    // Private Methods
    private Map getPlayersResultsMap(Tournament t) {
        def userResultList = []
        def userParticipationList = UserTournamentParticipation.findByTournament(t)

        userParticipationList.each { participation ->
           def userId = participation.user.id
           def userDataElement = [userId: userId, total: 0, stages: [:]]

           t.stages.each {
               def userStageTotal = 0
               stageService.getUsersTotalStagePoints(it.id,userId).each {
                   userStageTotal += it.points
               }
               userDataElement.stages[it.id] = userStageTotal
           }
           userResultList.add(userDataElement)
        }

        t.stages.each { stage ->


            if (stage.finished && stageTotalMax) {
                def stageUserTotal = 0


                def bonus = 4
                if (stageUserTotal > 2) {
                    bonus = 1
                } else if (stageUserTotal == 2) {
                    bonus = 2
                }
                mapUserData.each {key, value ->
                    if (value.TOTAL[0] == stageTotalMax) {
                        value.TOTAL[1] = bonus
                    }
                }
            }
        }



        mapUserData
    }
}
