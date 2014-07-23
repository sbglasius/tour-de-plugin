<div class="form-group ${invalid ? 'has-error' : ''}">
    <label for="${field}" class="col-sm-${cols ?: '2'} control-label">${label}</label>

    <div class="col-sm-${widgetCols ?: (12 - (cols?.toInteger() ?: 2))}">
        ${raw(widget)}
        <g:if test="${errors}">
            <g:each in="${errors}" var="error">
                <span class="help-block"><g:message error="${error}"/> </span>
            </g:each>
        </g:if>
    </div>
</div>
