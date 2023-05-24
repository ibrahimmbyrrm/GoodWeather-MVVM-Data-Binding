//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import Foundation

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm : WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section : Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index : Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    func removeCity(_ index : Int) {
        self.weatherViewModels.remove(at: index)
    }
}

class WeatherViewModel {
    
    let weather : WeatherResponse
    
    init(weather : WeatherResponse) {
        self.weather = weather
    }
    
    var city : String {
        return weather.name
    }
    
    var temprature : Double {
        return weather.main.temp
    }
}
