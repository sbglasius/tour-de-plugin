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
			<form class="form-horizontal ${domainClass.propertyName}">
			<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
				allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
				props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
				Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
				props.each { p -> %>
				<g:if test="\${${propertyName}?.${p.name}}">
				<div class="form-group">
					<label for="${p.name}" id="${p.name}-label" class="col-sm-2 contrl-label"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></label>
					<div class="col-sm-10">
                    <%  if (p.isEnum()) { %>
						<div class="form-control-static" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></div>
					<%  } else if (p.oneToMany || p.manyToMany) { %>
						<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
						<div class="form-control-static" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></div>
						</g:each>
					<%  } else if (p.manyToOne || p.oneToOne) { %>
						<div class="form-control-static" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></div>
					<%  } else if (p.type == Boolean || p.type == boolean) { %>
						<div class="form-control-static" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></div>
					<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<div class="form-control-static" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></div>
					<%  } else if (!p.type.isArray()) { %>
						<div class="form-control-static" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></div>
					<%  } %>
                    </div>
				</div>
				</g:if>
			<%  } %>
			</form>
			<g:form url="[resource:${propertyName}, action:'delete']" method="DELETE">
					<g:link class="btn btn-info" action="edit" resource="\${${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-danger" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</g:form>
		</div>
	</body>
</html>
