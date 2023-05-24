//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {

    private let weatherListViewModel = WeatherListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell
        let vmAtIndex = weatherListViewModel.modelAt(indexPath.row)
        cell.setupUI(vm: vmAtIndex)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       prepareSegueForAddWeatherCityViewController(segue: segue)
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue : UIStoryboardSegue) {
        guard let destination = segue.destination as? UINavigationController else {
            fatalError()
        }
        guard let destinationVC = destination.viewControllers.first as? AddCityViewController else {
            fatalError()
        }
        
        destinationVC.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            weatherListViewModel.removeCity(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
