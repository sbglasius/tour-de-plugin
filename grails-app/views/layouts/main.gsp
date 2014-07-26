<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>

<body>
<div class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="http://grails.org"><asset:image style="max-height: 25px" src="grails_logo.png" alt="Grails"/></a>
        </div>

        <div class="navbar-collapse collapse" id="navigation">
                <sec:ifLoggedIn>
                    <g:form controller="logout">
                    <ul class="nav navbar-nav navbar-right">
                        <li><button class="btn btn-link navbar-btn">Logout</button></li>
                    </ul>
                    </g:form>
                </sec:ifLoggedIn>
        </div><!--/.nav-collapse -->

    </div>
</div>

<div class="container" role="main">
    <g:layoutBody/>
</div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<asset:script>
    $(function() {
        var nav = $('*[role="navigation"].nav ul');
        nav.addClass('nav navbar-nav');
        $('#navigation').prepend(nav); // Move navigation to Bootstrap navigation
    });
</asset:script>
<asset:deferredScripts/>

</body>
</html>
