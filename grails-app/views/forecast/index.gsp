<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Forecast</title>
</head>

<body>
<h1>Forecast for Minneapolis</h1>
<table class="table">
    <tr>
    <th>Date</th>
    <th>Temps</th>
    <th>Precipitation</th>
    <th>Description</th>
    </tr>
    <g:each in="${forecasts}" var="forecast">
        <tr>
            <td><g:formatDate date="${forecast.date.toGregorianCalendar().time}"/></td>
            <td>${forecast.temperatures.morningLow}/${forecast.temperatures.daytimeHigh}</td>
            <td>${forecast.probabilityOfPrecipiation.nighttime}/${forecast.probabilityOfPrecipiation.daytime}</td>
            <td>${forecast.desciption}</td>
        </tr>
    </g:each>
</table>
</body>
</html>