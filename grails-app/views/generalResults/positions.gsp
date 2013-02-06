<%@ page import="org.tatu.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <title>TATU - Tabla de posiciones</title>
</head>
<body>
    <div style='width:900px;padding-left:150px'>
        <h3 style='padding-top:40px'>Tabla de posiciones</h3>
        <div style='border-bottom: 1px solid #ddd;'>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Jugador</th>
                    <th>Puntaje</th>
                    <g:each in="${stageList}" var="stage">
                        <th>${stage.name}</th>
                    </g:each>
                </tr>
                </thead>
                <tbody>
                <g:each in="${playerResults}" var="userDataElem" status="i">
                    <tr>
                        <td>${i + 1}</td>
                        <td>${User.get(userDataElem.userId).initials}</td>
                        <td>${userDataElem.total}</td>
                      <g:each in="${userDataElem.stages}" var="stageId, total" >
                        <td>${total}</td>
                      </g:each>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>