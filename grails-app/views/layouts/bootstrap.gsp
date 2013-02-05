<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
   <meta name="description" content="">
   <meta name="author" content="">
   <meta name="viewport" content="initial-scale = 1.0">
   <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
   <!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
   <r:require modules="scaffolding"/>
   <!-- Le fav and touch icons -->
   <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
   <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
   %{--<link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}">--}%
   <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}">
   <g:layoutHead/>
   <r:layoutResources/>

</head>

<body>

<nav class="navbar navbar-fixed-top">
   <div class="navbar-inner">
      <div class="container-fluid">

         <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
         </a>

         <a class="brand" href="${createLink(uri: '/')}"><i class="icon-white icon-star" style="margin-top: 5px;"></i> T.A.T.U.</a>
         <sec:ifLoggedIn>
          <ul class="nav">
              <li ${params.controller.equals('playerResults')?'class="active"':''}><g:link controller="playerResults">Mis Pronósticos</g:link></li>
              <li ${(params.controller.equals('generalResults') && !params.action.equals('positions'))?'class="active"':''}><g:link controller="generalResults">Resultados por Fecha</g:link></li>
              <li ${(params.controller.equals('generalResults') && params.action.equals('positions'))?'class="active"':''}><g:link controller="generalResults" action="positions">Tabla de Posiciones</g:link></li>
              <sec:ifAllGranted roles="ROLE_ADMIN">
                  <li>
                      <div class="btn-group">
                          <button class="btn btn-success dropdown-toggle" data-toggle="dropdown">Admin <span class="caret"></span></button>
                          <ul class="dropdown-menu">
                              <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                                  <g:if test="${!c.logicalPropertyName.equals('login') && !c.logicalPropertyName.equals('logout')}">
                                      <li><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link></li>
                                  </g:if>
                              </g:each>
                              <li class="divider"></li>
                              <li><g:link controller="dbconsole">DB Console</g:link></li>
                          </ul>
                      </div>
                  </li>
              </sec:ifAllGranted>
          </ul>
         </sec:ifLoggedIn>
         <sec:ifNotLoggedIn>
             <!-- TODO: Add welcome message -->
         </sec:ifNotLoggedIn>
      </div>
   </div>
</nav>

<div class="container-fluid">
   <g:layoutBody/>

   <hr>

   <footer style="text-align: center">
      <p>&copy; T.A.T.U ${new GregorianCalendar().get(Calendar.YEAR)}</p>
   </footer>
</div>

<r:layoutResources/>

</body>
</html>