//
//  Constants.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import Foundation

struct Constants {
    
    struct Urls {
        static func urlForWeatherByCity(city : String) -> URL {
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=dcc0d766cd96ccc845ca9058b1e46396&units=metric")!
        }
    }
    
}
