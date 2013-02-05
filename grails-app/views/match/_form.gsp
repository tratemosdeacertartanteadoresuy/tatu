<%@ page import="org.tatu.Match" %>



<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'finished', 'error')} ">
	<label for="finished">
		<g:message code="match.finished.label" default="Finished" />
		
	</label>
	<g:checkBox name="finished" value="${matchInstance?.finished}" />
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'home', 'error')} required">
	<label for="home">
		<g:message code="match.home.label" default="Home" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="home" name="home.id" from="${org.tatu.Team.list()}" optionKey="id" required="" value="${matchInstance?.home?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'homeScore', 'error')} required">
	<label for="homeScore">
		<g:message code="match.homeScore.label" default="Home Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="homeScore" required="" value="${fieldValue(bean: matchInstance, field: 'homeScore')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'stage', 'error')} required">
	<label for="stage">
		<g:message code="match.stage.label" default="Stage" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="stage" name="stage.id" from="${org.tatu.Stage.list()}" optionKey="id" required="" value="${matchInstance?.stage?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'visitor', 'error')} required">
	<label for="visitor">
		<g:message code="match.visitor.label" default="Visitor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="visitor" name="visitor.id" from="${org.tatu.Team.list()}" optionKey="id" required="" value="${matchInstance?.visitor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: matchInstance, field: 'visitorScore', 'error')} required">
	<label for="visitorScore">
		<g:message code="match.visitorScore.label" default="Visitor Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="visitorScore" required="" value="${fieldValue(bean: matchInstance, field: 'visitorScore')}"/>
</div>

