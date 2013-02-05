<g:formRemote name="stageResults" url="[controller: 'playerResults', action:'save']" class="form-horizontal" update="stageDetails">
    <g:render template="../utils/messagesAndErrors" model="[message:flash.message,beanInstance:stage]"/>
    <g:hiddenField name="id" value="${stage.id}"/>
    <div id='colLocal' style='width:49%; float:left'>
        <g:each in="${stage.matches}" var="match">
            <div class="control-group">
                <label class="control-label" for="result.${match.home.id}">${match.home.name}</label>
                <div class="controls controls-row">
                    <g:textField name="result.${match.home.id}" placeholder="-" value="${(results[match.home.id] instanceof Integer)?results[match.home.id]:''}"/>
                </div>
            </div>
        </g:each>
    </div>
    <div id='colVisitor' style='width:49%; float:right'>
        <g:each in="${stage.matches}" var="match">
            <div class="control-group">
                <label class="control-label" for="result.${match.visitor.id}">${match.visitor.name}</label>
                <div class="controls controls-row">
                    <g:textField name="result.${match.visitor.id}" placeholder="-"  value="${(results[match.visitor.id] instanceof Integer)?results[match.visitor.id]:''}"/>
                </div>
            </div>
        </g:each>
    </div>

    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-primary">Guardar Fecha</button>
        </div>
    </div>
</g:formRemote>