//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import Foundation

struct AddWeatherViewModel {
    
    func addCity(for city : String,completion: @escaping(WeatherViewModel) -> Void) {
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        Webservice().load(resource: weatherResource) { result in
            if let weatherResource = result {
                let vm = WeatherViewModel(weather : weatherResource)
                completion(vm)
            }
        }
        
    }
}
