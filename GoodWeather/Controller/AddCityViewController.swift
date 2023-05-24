//
//  AddCityViewController.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm : WeatherViewModel)
}

class AddCityViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    private var addWeatherVM = AddWeatherViewModel()
    var delegate : AddWeatherDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func saveButtonClicked(_ sender: Any) {
       
        guard let city = cityNameTextField.text else {return}
        addWeatherVM.addCity(for: city) { vm in
            DispatchQueue.main.async {
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true)
            }
            
        }
       
    }
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true,completion: nil)
    }
    
}
