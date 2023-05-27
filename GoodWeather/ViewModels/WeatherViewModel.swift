//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import Foundation
// MARK: - Main Functions About Weather List
final class WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
    

    func numberOfRows(_ section : Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index : Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
}
// MARK: - Functions Responsible for Editing Our Weather List
extension WeatherListViewModel {
    
    func removeCity(_ index : Int) {
        self.weatherViewModels.remove(at: index)
    }
    
    func addWeatherViewModel(_ vm : WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func updateUnit(to unit: Unit) {
        let converter = UnitConverter(weatherViewModels: weatherViewModels)
        switch unit {
            case .celsius:
            converter.toCelsius()
            case .fahrenheit:
            converter.toFahrenheit()
        }
    }
}

// MARK: - Our Model's properties which we are using in tableview.
final class WeatherViewModel {
    
    let weather : WeatherResponse
    var temprature : Double
    
    init(weather : WeatherResponse) {
        self.weather = weather
        temprature = weather.main.temp
    }
    
    var city : String {
        return weather.name
    }

}
