package org.tatu



import org.junit.*
import grails.test.mixin.*

@TestFor(UserTournamentParticipationController)
@Mock(UserTournamentParticipation)
class UserTournamentParticipationControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userTournamentParticipation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userTournamentParticipationInstanceList.size() == 0
        assert model.userTournamentParticipationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userTournamentParticipationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userTournamentParticipationInstance != null
        assert view == '/userTournamentParticipation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userTournamentParticipation/show/1'
        assert controller.flash.message != null
        assert UserTournamentParticipation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userTournamentParticipation/list'


        populateValidParams(params)
        def userTournamentParticipation = new UserTournamentParticipation(params)

        assert userTournamentParticipation.save() != null

        params.id = userTournamentParticipation.id

        def model = controller.show()

        assert model.userTournamentParticipationInstance == userTournamentParticipation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userTournamentParticipation/list'


        populateValidParams(params)
        def userTournamentParticipation = new UserTournamentParticipation(params)

        assert userTournamentParticipation.save() != null

        params.id = userTournamentParticipation.id

        def model = controller.edit()

        assert model.userTournamentParticipationInstance == userTournamentParticipation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userTournamentParticipation/list'

        response.reset()


        populateValidParams(params)
        def userTournamentParticipation = new UserTournamentParticipation(params)

        assert userTournamentParticipation.save() != null

        // test invalid parameters in update
        params.id = userTournamentParticipation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userTournamentParticipation/edit"
        assert model.userTournamentParticipationInstance != null

        userTournamentParticipation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userTournamentParticipation/show/$userTournamentParticipation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userTournamentParticipation.clearErrors()

        populateValidParams(params)
        params.id = userTournamentParticipation.id
        params.version = -1
        controller.update()

        assert view == "/userTournamentParticipation/edit"
        assert model.userTournamentParticipationInstance != null
        assert model.userTournamentParticipationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userTournamentParticipation/list'

        response.reset()

        populateValidParams(params)
        def userTournamentParticipation = new UserTournamentParticipation(params)

        assert userTournamentParticipation.save() != null
        assert UserTournamentParticipation.count() == 1

        params.id = userTournamentParticipation.id

        controller.delete()

        assert UserTournamentParticipation.count() == 0
        assert UserTournamentParticipation.get(userTournamentParticipation.id) == null
        assert response.redirectedUrl == '/userTournamentParticipation/list'
    }
}
