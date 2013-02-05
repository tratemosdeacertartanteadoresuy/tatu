<%@ page contentType="text/html;charset=UTF-8" %>
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
                <tr>
                    <td>1</td>
                    <td>SB</td>
                    <td>187</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>RM</td>
                    <td>177</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>KR</td>
                    <td>177</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                    <td>10</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>