<html>
<head>
	<meta name='layout' content='bootstrap'/>
	<title><g:message code="springSecurity.login.title"/></title>

</head>

<body>

    <div class="content" style="width: 440px;display: block;margin-left: auto;margin-right: auto;margin-top: 50px;margin-bottom: 50px">
        <g:if test='${flash.message}'>
            <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">×</button>
                ${flash.message}
            </div>
        </g:if>
        <form class="form-horizontal" action="/TATU/j_spring_security_check" method="POST" id="loginForm" class="cssform">
            <div class="control-group">
                <label class="control-label" for="username">Email</label>
                <div class="controls">
                    <input type="text" name="j_username" id="username" placeholder="Email">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="password">Password</label>
                <div class="controls">
                    <input type="password" name="j_password" id="password" placeholder="Password">
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <label class="checkbox">
                        <input type="checkbox" name="_spring_security_remember_me" id="remember_me"> Recordarme
                    </label>
                    <button type="submit" id="submit" class="btn">Ingresar</button>
                </div>
            </div>
        </form>

    </div>
    <script type='text/javascript'>
        <!--
        (function() {
            document.forms['loginForm'].elements['j_username'].focus();
        })();
        // -->
    </script>
</body>
</html>
