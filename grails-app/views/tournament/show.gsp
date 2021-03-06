
<%@ page import="org.tatu.Tournament" %>
<!doctype html>
<html>
<head>
   <meta name="layout" content="bootstrap">
   <g:set var="entityName" value="${message(code: 'tournament.label', default: 'Tournament')}" />
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
         
         <g:if test="${tournamentInstance?.active}">

            <dt><g:message code="tournament.active.label" default="Active" /></dt>
            
            <dd><g:formatBoolean boolean="${tournamentInstance?.active}" /></dd>
            

         </g:if>
         
         <g:if test="${tournamentInstance?.name}">

            <dt><g:message code="tournament.name.label" default="Name" /></dt>
            
            <dd><g:fieldValue bean="${tournamentInstance}" field="name"/></dd>
            

         </g:if>
         
         <g:if test="${tournamentInstance?.stages}">

            <dt><g:message code="tournament.stages.label" default="Stages" /></dt>
            
            <g:each in="${tournamentInstance.stages}" var="s">
               <dd><g:link controller="stage" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></dd>
            </g:each>
            

         </g:if>
         
         <g:if test="${tournamentInstance?.startingDate}">

            <dt><g:message code="tournament.startingDate.label" default="Starting Date" /></dt>
            
            <dd><g:formatDate date="${tournamentInstance?.startingDate}" /></dd>
            

         </g:if>
         
      </dl>

      <g:form>

         <g:hiddenField name="id" value="${tournamentInstance?.id}" />
         <div class="form-actions">
            <g:link class="btn" action="edit" id="${tournamentInstance?.id}">
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
