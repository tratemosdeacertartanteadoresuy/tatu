<%@ page import="org.tatu.UserTournamentParticipation" %>



<div class="fieldcontain ${hasErrors(bean: userTournamentParticipationInstance, field: 'tournament', 'error')} required">
	<label for="tournament">
		<g:message code="userTournamentParticipation.tournament.label" default="Tournament" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tournament" name="tournament.id" from="${org.tatu.Tournament.list()}" optionKey="id" required="" value="${userTournamentParticipationInstance?.tournament?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userTournamentParticipationInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userTournamentParticipation.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${org.tatu.User.list()}" optionKey="id" required="" value="${userTournamentParticipationInstance?.user?.id}" class="many-to-one"/>
</div>

