package org.tatu

import org.springframework.dao.DataIntegrityViolationException

class StageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [stageInstanceList: Stage.list(params), stageInstanceTotal: Stage.count()]
    }

    def create() {
        [stageInstance: new Stage(params)]
    }

    def save() {
        def stageInstance = new Stage(params)
        if (!stageInstance.save(flush: true)) {
            render(view: "create", model: [stageInstance: stageInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'stage.label', default: 'Stage'), stageInstance.id])
        redirect(action: "show", id: stageInstance.id)
    }

    def show() {
        def stageInstance = Stage.get(params.id)
        if (!stageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'stage.label', default: 'Stage'), params.id])
            redirect(action: "list")
            return
        }

        [stageInstance: stageInstance]
    }

    def edit() {
        def stageInstance = Stage.get(params.id)
        if (!stageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stage.label', default: 'Stage'), params.id])
            redirect(action: "list")
            return
        }

        [stageInstance: stageInstance]
    }

    def update() {
        def stageInstance = Stage.get(params.id)
        if (!stageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'stage.label', default: 'Stage'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (stageInstance.version > version) {
                stageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'stage.label', default: 'Stage')] as Object[],
                          "Another user has updated this Stage while you were editing")
                render(view: "edit", model: [stageInstance: stageInstance])
                return
            }
        }

        stageInstance.properties = params

        if (!stageInstance.save(flush: true)) {
            render(view: "edit", model: [stageInstance: stageInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'stage.label', default: 'Stage'), stageInstance.id])
        redirect(action: "show", id: stageInstance.id)
    }

    def delete() {
        def stageInstance = Stage.get(params.id)
        if (!stageInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'stage.label', default: 'Stage'), params.id])
            redirect(action: "list")
            return
        }

        try {
            stageInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'stage.label', default: 'Stage'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'stage.label', default: 'Stage'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
