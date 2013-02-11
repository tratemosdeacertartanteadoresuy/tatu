<%@ page import="org.tatu.UserTournamentParticipation" %>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Partido</th>
                <th style="text-align: center">Resultado</th>
              <g:each in="${userList}" var="user">
                <th style="text-align: center">${user.initials}</th>
              </g:each>
            </tr>
            </thead>
            <tbody >
          <g:each in="${stage.matches}" var="match">
            <tr>
                <td>${match.home.name + ' - ' + match.visitor.name}</td>
                <td style="text-align: center">${match.finished?(match.homeScore + ' - ' + match.visitorScore):'&nbsp;'}</td>
                <g:each in="${userList}" var="user">
                    <td style="text-align: center">
                        <g:if test="${results[user.id][match.id][0] == -1}">
                            &nbsp;
                        </g:if>
                        <g:elseif test="${results[user.id][match.id][2] == 3}">
                            <span class="label label-info" style="border-radius: 9px;padding-right:9px;padding-left: 9px" title="3 puntos">${results[user.id][match.id][0] + ' - ' + results[user.id][match.id][1]}</span>
                        </g:elseif>
                        <g:elseif test="${results[user.id][match.id][2] == 5}">
                            <span class="label label-important" style="border-radius: 9px;padding-right:9px;padding-left: 9px" title="5 puntos">${results[user.id][match.id][0] + ' - ' + results[user.id][match.id][1]}</span>
                        </g:elseif>
                        <g:else>
                            ${results[user.id][match.id][0] + ' - ' + results[user.id][match.id][1]}
                        </g:else>
                    </td>
                </g:each>
            </tr>
          </g:each>
            <tr style='font-weight:bold'>
                <td>TOTAL fecha</td>
                <td></td>
              <g:each in="${userList}" var="user">
                  <g:if test="${results[user.id].TOTAL[1] > 0}">
                      <td style="text-align: center" title="Ganador de la fecha - Bonus ${results[user.id].TOTAL[1]} puntos"><span class="label label-success" style="padding-left: 15px;padding-right: 15px">${results[user.id].TOTAL[0] + results[user.id].TOTAL[1]}</span></td>
                  </g:if>
                  <g:else>
                      <td style="text-align: center">${results[user.id].TOTAL[0]}</td>
                  </g:else>


              </g:each>

            </tr>
            </tbody>
        </table>