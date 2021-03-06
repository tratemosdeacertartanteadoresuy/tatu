<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="bootstrap"/>
  <title>TATU - Mis Resultados</title>
</head>
<body>
    <div style='width:800px;padding-left:150px'>
        <h3 style='padding-top:40px'>Resultados RM</h3>
        <div style='border-bottom: 1px solid #ddd;'>

            <ul id='stageListNav' class="nav nav-tabs">
                <g:each in="${stageList}" var="stage">
                    <li id='stage${stage.id}'>
                        <g:remoteLink method="GET" action="getStage" id="${stage.id}" update="stageDetails" after="activateTab(${stage.id})">${stage.name}</g:remoteLink>
                    </li>
                </g:each>
            </ul>
            <div id="stageDetails">
               <g:if test="${stageList.size() > 0}">
                   <g:render template="stageResults" model="[stage: stageList?.first(), results:playerResults]"/>
               </g:if>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        //function showFecha(elem, number) {
        //    $(elem).parent().parent().find('li.active').removeClass('active');
        //    $(elem).parent().addClass('active');
        //}

        function activateTab(elemId) {
            var elem= $('li#stage' +  elemId);
            $(elem).parent().find('li.active').removeClass('active');
            $(elem).addClass('active');
        }

        $(document).ready(function() {
            $($('ul#stageListNav > li')[0]).addClass('active');
        });
    </script>
</body>
</html>