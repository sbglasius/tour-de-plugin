<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>The Mailer</title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>

<div class="content" role="main">
    <g:if test="${flash.message}">
        <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>

    <g:form class="form">
        <p><g:actionSubmit value="Send text mail via controller" action="sendPlainTextMail" class="btn btn-info"/></p>

    </g:form>
</div>
</body>
</html>