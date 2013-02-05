package org.tatu

class PlayerResultsController {

    def springSecurityService
    def scorePredictionService

    String RESULT_PREDICTION_PREFIX = 'result.'

    def index() {
        def stageList = []
        def t = Tournament.findByActive(true)
        if (t) {
            stageList = t.stages
        }
        [stageList: stageList, playerResults:getPlayerResultsMap((Stage)stageList.first())]
    }

    def getStage() {
        def stage = Stage.get(params.id)
        render (template: 'stageResults', model: [stage: stage, results:getPlayerResultsMap(stage)])
    }


    def save() {
        def stage = Stage.get(params.id)
        def scorePredictions = getPlayerResultsMap(params, stage)
       if ((stage.matches.size()*2) != scorePredictions.keySet().size()) {
           stage.errors.reject('stage.notAllResultsEntered.error',null, 'para guardar debe ingresar todos los resultados de la fecha')
           render template: 'stageResults', model: [stage: stage, results:getPlayerResultsMap(stage)]
       } else if (stage.startingDate.before(new Date())){
           stage.errors.reject('stage.alreadyStarted.error',null, 'fecha ya en curso')
           render template: 'stageResults', model: [stage: stage, results:getPlayerResultsMap(stage)]
       } else if (stage.tournament.startingDate.before(new Date())){
           stage.errors.reject('tournament.alreadyStarted.error',null, 'fecha ya en curso')
           render template: 'stageResults', model: [stage: stage, results:getPlayerResultsMap(stage)]
       } else {
          try {
              scorePredictionService.saveScorePredictions(User.get(springSecurityService.getPrincipal().id),stage, scorePredictions)
              flash.message = "${message(code: 'default.saved.label', default: 'changes saved')}"
              redirect action: 'getStage', id: stage.id
          } catch (Exception e) {
             log.error('Unexpected error: '+ e.getMessage())
             stage.errors.reject('default.unexpectedError.label','unexpected error')
             render template: 'stageResults', model: [stage: stage, results:getPlayerResultsMap(stage)]
          }
       }
    }

    // Private Methods
    private Map getPlayerResultsMap(Stage stage) {
        def resultPredictions = [:]
        def user = User.get(springSecurityService.getPrincipal().id)
        def resultList = ScorePrediction.findAllByUserAndStage(user,stage)
        resultList.each{
            resultPredictions[it.match.home.id] = new Integer(it.homeScore)
            resultPredictions[it.match.visitor.id] = new Integer(it.visitorScore)
        }
        resultPredictions
    }

    private Map getPlayerResultsMap(Map params, Stage stage) {
        def resultPredictions = [:]
        stage?.matches.each {
            if (params[RESULT_PREDICTION_PREFIX+it.visitor.id]) {
              resultPredictions[it.visitor.id] = Integer.parseInt(params[RESULT_PREDICTION_PREFIX+it.visitor.id])
            }
            if (params[RESULT_PREDICTION_PREFIX+it.home.id]) {
                resultPredictions[it.home.id] = Integer.parseInt(params[RESULT_PREDICTION_PREFIX+it.home.id])
            }
        }
        resultPredictions
    }
}
