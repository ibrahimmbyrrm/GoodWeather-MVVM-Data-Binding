//
//  UnitConverter.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 27.05.2023.
//

import Foundation

final class UnitConverter {
    var weatherViewModels : [WeatherViewModel]
    
    init(weatherViewModels: [WeatherViewModel]) {
        self.weatherViewModels = weatherViewModels
    }
    
    func toFahrenheit() {
        
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temprature = (weatherModel.temprature * 9/5) + 32
            return weatherModel
        }
    }
    
    func toCelsius() {
        
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temprature = (weatherModel.temprature - 32) * 5/9
            return weatherModel
        }
        
    }
}
