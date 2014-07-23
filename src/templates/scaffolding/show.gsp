<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-${domainClass.propertyName}" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-${domainClass.propertyName}" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="\${flash.message}">
			<div class="alert alert-success" role="status">\${flash.message}</div>
			</g:if>
            <div class="form-horizontal">
                <f:with bean="\${${propertyName} }">
                    <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
                    allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
                    props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
                    Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                    props.each { p -> %>
                    <g:if test="\${${propertyName}?.${p.name}}">
                        <f:display property="${p.name}"/>
                    </g:if>
                    <% } %>
                </f:with>
                <div class="row">
                    <div class="col-sm-2"></div>

                    <div class="col-sm-10">
                        <g:form url="[resource: ${ propertyName }, action: 'delete']" method="DELETE">
                            <g:link class="edit btn btn-primary" action="edit" resource="\${${propertyName}}"><g:message code="default.button.edit.label" default="Edit"/></g:link>
                            <g:actionSubmit class="delete btn btn-warning" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                        </g:form>
                    </div>
            </div>
	</body>
</html>
