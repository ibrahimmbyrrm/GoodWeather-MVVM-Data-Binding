//
//  WeatherTableViewCell.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempratureLabel: UILabel!
    
    func setupUI(vm : WeatherViewModel) {
        self.cityNameLabel.text = vm.city
        self.tempratureLabel.text = vm.temprature.formatAsDegree()
    }
}
