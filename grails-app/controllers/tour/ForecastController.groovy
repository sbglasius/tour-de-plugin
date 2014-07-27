package tour

import com.cdyne.ws.weatherws.ForecastReturn
import com.cdyne.ws.weatherws.WeatherSoap
import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class ForecastController {
    WeatherSoap weatherClient

    def index() {
        ForecastReturn forecastByZIP = weatherClient.getCityForecastByZIP("55403")
        [forecasts: forecastByZIP.forecastResult.forecast]
    }
}
