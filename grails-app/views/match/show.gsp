
<%@ page import="org.tatu.Match" %>
<!doctype html>
<html>
<head>
   <meta name="layout" content="bootstrap">
   <g:set var="entityName" value="${message(code: 'match.label', default: 'Match')}" />
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
         
         <g:if test="${matchInstance?.finished}">

            <dt><g:message code="match.finished.label" default="Finished" /></dt>
            
            <dd><g:formatBoolean boolean="${matchInstance?.finished}" /></dd>
            

         </g:if>
         
         <g:if test="${matchInstance?.home}">

            <dt><g:message code="match.home.label" default="Home" /></dt>
            
            <dd><g:link controller="team" action="show" id="${matchInstance?.home?.id}">${matchInstance?.home?.encodeAsHTML()}</g:link></dd>
            

         </g:if>
         
         <g:if test="${matchInstance?.homeScore}">

            <dt><g:message code="match.homeScore.label" default="Home Score" /></dt>
            
            <dd><g:fieldValue bean="${matchInstance}" field="homeScore"/></dd>
            

         </g:if>
         
         <g:if test="${matchInstance?.stage}">

            <dt><g:message code="match.stage.label" default="Stage" /></dt>
            
            <dd><g:link controller="stage" action="show" id="${matchInstance?.stage?.id}">${matchInstance?.stage?.encodeAsHTML()}</g:link></dd>
            

         </g:if>
         
         <g:if test="${matchInstance?.visitor}">

            <dt><g:message code="match.visitor.label" default="Visitor" /></dt>
            
            <dd><g:link controller="team" action="show" id="${matchInstance?.visitor?.id}">${matchInstance?.visitor?.encodeAsHTML()}</g:link></dd>
            

         </g:if>
         
         <g:if test="${matchInstance?.visitorScore}">

            <dt><g:message code="match.visitorScore.label" default="Visitor Score" /></dt>
            
            <dd><g:fieldValue bean="${matchInstance}" field="visitorScore"/></dd>
            

         </g:if>
         
      </dl>

      <g:form>

         <g:hiddenField name="id" value="${matchInstance?.id}" />
         <div class="form-actions">
            <g:link class="btn" action="edit" id="${matchInstance?.id}">
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
