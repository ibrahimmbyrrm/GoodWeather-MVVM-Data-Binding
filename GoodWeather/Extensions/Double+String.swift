//
//  Double+String.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
