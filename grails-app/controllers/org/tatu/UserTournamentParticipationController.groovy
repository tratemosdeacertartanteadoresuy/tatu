package org.tatu

import org.springframework.dao.DataIntegrityViolationException

class UserTournamentParticipationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userTournamentParticipationInstanceList: UserTournamentParticipation.list(params), userTournamentParticipationInstanceTotal: UserTournamentParticipation.count()]
    }

    def create() {
        [userTournamentParticipationInstance: new UserTournamentParticipation(params)]
    }

    def save() {
        def userTournamentParticipationInstance = new UserTournamentParticipation(params)
        if (!userTournamentParticipationInstance.save(flush: true)) {
            render(view: "create", model: [userTournamentParticipationInstance: userTournamentParticipationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation'), userTournamentParticipationInstance.id])
        redirect(action: "show", id: userTournamentParticipationInstance.id)
    }

    def show() {
        def userTournamentParticipationInstance = UserTournamentParticipation.get(params.id)
        if (!userTournamentParticipationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation'), params.id])
            redirect(action: "list")
            return
        }

        [userTournamentParticipationInstance: userTournamentParticipationInstance]
    }

    def edit() {
        def userTournamentParticipationInstance = UserTournamentParticipation.get(params.id)
        if (!userTournamentParticipationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation'), params.id])
            redirect(action: "list")
            return
        }

        [userTournamentParticipationInstance: userTournamentParticipationInstance]
    }

    def update() {
        def userTournamentParticipationInstance = UserTournamentParticipation.get(params.id)
        if (!userTournamentParticipationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userTournamentParticipationInstance.version > version) {
                userTournamentParticipationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation')] as Object[],
                        "Another user has updated this UserTournamentParticipation while you were editing")
                render(view: "edit", model: [userTournamentParticipationInstance: userTournamentParticipationInstance])
                return
            }
        }

        userTournamentParticipationInstance.properties = params

        if (!userTournamentParticipationInstance.save(flush: true)) {
            render(view: "edit", model: [userTournamentParticipationInstance: userTournamentParticipationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation'), userTournamentParticipationInstance.id])
        redirect(action: "show", id: userTournamentParticipationInstance.id)
    }

    def delete() {
        def userTournamentParticipationInstance = UserTournamentParticipation.get(params.id)
        if (!userTournamentParticipationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userTournamentParticipationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
