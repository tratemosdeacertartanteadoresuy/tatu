
<%@ page import="org.tatu.Match" %>
<!doctype html>
<html>
<head>
   <meta name="layout" content="bootstrap">
   <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
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
            
            <g:sortableColumn property="finished" title="${message(code: 'match.finished.label', default: 'Finished')}" />
            
            <th class="header"><g:message code="match.home.label" default="Home" /></th>
            
            <g:sortableColumn property="homeScore" title="${message(code: 'match.homeScore.label', default: 'Home Score')}" />
            
            <th class="header"><g:message code="match.stage.label" default="Stage" /></th>
            
            <th class="header"><g:message code="match.visitor.label" default="Visitor" /></th>
            
            <g:sortableColumn property="visitorScore" title="${message(code: 'match.visitorScore.label', default: 'Visitor Score')}" />
            
            <th></th>
         </tr>
         </thead>
         <tbody>
         <g:each in="${matchInstanceList}" var="matchInstance">
            <tr>

               
               <td><g:formatBoolean boolean="${matchInstance.finished}" /></td>
               
               <td>${fieldValue(bean: matchInstance, field: "home")}</td>
               
               <td>${fieldValue(bean: matchInstance, field: "homeScore")}</td>
               
               <td>${fieldValue(bean: matchInstance, field: "stage")}</td>
               
               <td>${fieldValue(bean: matchInstance, field: "visitor")}</td>
               
               <td>${fieldValue(bean: matchInstance, field: "visitorScore")}</td>
               
               <td class="link">
                  <g:link action="show" id="${matchInstance.id}" class="btn btn-small">Show &raquo;</g:link>
               </td>
            </tr>
         </g:each>
         </tbody>
      </table>
      <div class="pagination">
         <bootstrap:paginate total="${matchInstanceTotal}" />
      </div>
   </div>

</div>
</body>
</html>
