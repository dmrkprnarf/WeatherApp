

import Foundation

protocol WeatherMenagerDelegate {
    func didUpdateMenager(weather:WeatherModel)
    func didFailWithError(error:Error)
}


struct WeatherMenager {
    
    var delegate:WeatherMenagerDelegate!
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=032efabe0d044e0d56235b7e8c325b07&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
 
    }
    
    func performRequest(with urlString:String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task =  session.dataTask(with: url) { data, response, error in
                if error != nil {
                    if let safeError = error {
                        delegate.didFailWithError(error: safeError)
                    }
                }
                if let safeData = data {
                    let weather = self.parseJSON(weatherData: safeData)
                    if let safeWeather = weather {
                        delegate.didUpdateMenager(weather: safeWeather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData:Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodingData =  try  decoder.decode(WeatherData.self, from: weatherData)
            let id = decodingData.weather[0].id
            let temp = decodingData.main.temp
            let name = decodingData.name
            let country = decodingData.sys.country
            let weather = WeatherModel(conditionId: id, cityName: name, tempature: temp, country: country)
             return weather
        } catch {
            delegate.didFailWithError(error: error)
            return nil
        }
    }
}
    

