<!--
  ERRORS & MESSAGES
  @param message - string with message, if null not shown
  @param beanInstance - Bean with grails errors
-->
<g:if test="${message}">
    <div id="stageMessage" class="alert alert-success" style="display:none">
        <button type="button" class="close" data-dismiss="alert">×</button>
        ${message}
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#stageMessage').slideDown().delay(6000).slideUp();
        });
    </script>
</g:if>
<g:hasErrors bean="${beanInstance}">
    <div id="defaultError" class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <g:renderErrors bean="${beanInstance}" as="list" />
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#defaultError').slideDown().delay(8000).slideUp();
        });
    </script>
</g:hasErrors>