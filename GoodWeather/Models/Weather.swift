//
//  Weather.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import Foundation

struct WeatherResponse : Decodable {
    let name : String
    let main : Weather
}

struct Weather : Decodable {
    let temp : Double
    let humidity : Double
}
