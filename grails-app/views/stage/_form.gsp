<%@ page import="org.tatu.Stage" %>



<div class="fieldcontain ${hasErrors(bean: stageInstance, field: 'matches', 'error')} ">
	<label for="matches">
		<g:message code="stage.matches.label" default="Matches" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${stageInstance?.matches?}" var="m">
    <li><g:link controller="match" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="match" action="create" params="['stage.id': stageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'match.label', default: 'Match')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: stageInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="stage.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${stageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stageInstance, field: 'startingDate', 'error')} required">
	<label for="startingDate">
		<g:message code="stage.startingDate.label" default="Starting Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startingDate" precision="day"  value="${stageInstance?.startingDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: stageInstance, field: 'tournament', 'error')} required">
	<label for="tournament">
		<g:message code="stage.tournament.label" default="Tournament" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tournament" name="tournament.id" from="${org.tatu.Tournament.list()}" optionKey="id" required="" value="${stageInstance?.tournament?.id}" class="many-to-one"/>
</div>

