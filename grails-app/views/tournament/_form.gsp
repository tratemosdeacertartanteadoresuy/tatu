<%@ page import="org.tatu.Tournament" %>



<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="tournament.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${tournamentInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="tournament.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${tournamentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'stages', 'error')} ">
	<label for="stages">
		<g:message code="tournament.stages.label" default="Stages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tournamentInstance?.stages?}" var="s">
    <li><g:link controller="stage" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="stage" action="create" params="['tournament.id': tournamentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'stage.label', default: 'Stage')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: tournamentInstance, field: 'startingDate', 'error')} required">
	<label for="startingDate">
		<g:message code="tournament.startingDate.label" default="Starting Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startingDate" precision="day"  value="${tournamentInstance?.startingDate}"  />
</div>

