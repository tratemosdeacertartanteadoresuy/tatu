
<%@ page import="org.tatu.Stage" %>
<!doctype html>
<html>
<head>
   <meta name="layout" content="bootstrap">
   <g:set var="entityName" value="${message(code: 'stage.label', default: 'Stage')}" />
   <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">

   <div class="span3">
      <div class="well">

         <ul class="nav nav-list">
            <li class="nav-header">${entityName}</li>
            <li class="active">
               <g:link class="list" action="list">
                  <i class="icon-list icon-white"></i>

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
         <h1><g:message code="default.list.label" args="[entityName]" /></h1>
      </div>

      <g:if test="${flash.message}">
         <bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
      </g:if>

      <table class="table table-striped">

         <thead>
         <tr>
            
            <g:sortableColumn property="name" title="${message(code: 'stage.name.label', default: 'Name')}" />
            
            <g:sortableColumn property="startingDate" title="${message(code: 'stage.startingDate.label', default: 'Starting Date')}" />
            
            <th class="header"><g:message code="stage.tournament.label" default="Tournament" /></th>
            
            <th></th>
         </tr>
         </thead>
         <tbody>
         <g:each in="${stageInstanceList}" var="stageInstance">
            <tr>

               
               <td>${fieldValue(bean: stageInstance, field: "name")}</td>
               
               <td><g:formatDate date="${stageInstance.startingDate}" /></td>
               
               <td>${fieldValue(bean: stageInstance, field: "tournament")}</td>
               
               <td class="link">
                  <g:link action="show" id="${stageInstance.id}" class="btn btn-small">Show &raquo;</g:link>
               </td>
            </tr>
         </g:each>
         </tbody>
      </table>
      <div class="pagination">
         <bootstrap:paginate total="${stageInstanceTotal}" />
      </div>
   </div>

</div>
</body>
</html>
