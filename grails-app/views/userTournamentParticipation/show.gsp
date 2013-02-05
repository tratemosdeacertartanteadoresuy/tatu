
<%@ page import="org.tatu.UserTournamentParticipation" %>
<!doctype html>
<html>
<head>
   <meta name="layout" content="bootstrap">
   <g:set var="entityName" value="${message(code: 'userTournamentParticipation.label', default: 'UserTournamentParticipation')}" />
   <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>


<div class="row-fluid">

   <div class="span3">
      <div class="well">
         <ul class="nav nav-list">

            <li class="nav-header">${entityName}</li>
            <li>
               <g:link class="list" action="list">
                  <i class="icon-list"></i>
                  <g:message code="default.list.label" args="[entityName]" />
               </g:link>
            </li>
            <li>
               <g:link class="create" action="create">
                  <i class="icon-plus"></i>
                  <g:message code="default.create.label" args="[entityName]" />
               </g:link>
            </li>
         </ul>
      </div>

   </div>

   <div class="span9">

      <div class="page-header">
         <h1><g:message code="default.show.label" args="[entityName]" /></h1>
      </div>

      <g:if test="${flash.message}">
         <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
      </g:if>


      <dl>
         
         <g:if test="${userTournamentParticipationInstance?.tournament}">

            <dt><g:message code="userTournamentParticipation.tournament.label" default="Tournament" /></dt>
            
            <dd><g:link controller="tournament" action="show" id="${userTournamentParticipationInstance?.tournament?.id}">${userTournamentParticipationInstance?.tournament?.encodeAsHTML()}</g:link></dd>
            

         </g:if>
         
         <g:if test="${userTournamentParticipationInstance?.user}">

            <dt><g:message code="userTournamentParticipation.user.label" default="User" /></dt>
            
            <dd><g:link controller="user" action="show" id="${userTournamentParticipationInstance?.user?.id}">${userTournamentParticipationInstance?.user?.encodeAsHTML()}</g:link></dd>
            

         </g:if>
         
      </dl>

      <g:form>

         <g:hiddenField name="id" value="${userTournamentParticipationInstance?.id}" />
         <div class="form-actions">
            <g:link class="btn" action="edit" id="${userTournamentParticipationInstance?.id}">
               <i class="icon-pencil"></i>
               <g:message code="default.button.edit.label" default="Edit" />


            </g:link>
            <button class="btn btn-danger" type="submit" name="_action_delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
               <i class="icon-trash icon-white"></i>
               <g:message code="default.button.delete.label" default="Delete" />
            </button>
         </div>
      </g:form>

   </div>

</div>
</body>
</html>
