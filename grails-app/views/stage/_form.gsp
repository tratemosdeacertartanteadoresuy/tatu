<%@ page import="org.tatu.Stage" %>



<div class="fieldcontain ${hasErrors(bean: stageInstance, field: 'matches', 'error')} ">
	<label for="matches">
		<g:message code="stage.matches.label" default="Matches" />
		
	</label>
	<g:select name="matches" from="${org.tatu.Match.list()}" multiple="multiple" optionKey="id" size="5" value="${stageInstance?.matches*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stageInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="stage.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${stageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stageInstance, field: 'tournament', 'error')} required">
	<label for="tournament">
		<g:message code="stage.tournament.label" default="Tournament" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tournament" name="tournament.id" from="${org.tatu.Tournament.list()}" optionKey="id" required="" value="${stageInstance?.tournament?.id}" class="many-to-one"/>
</div>

