//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 26.05.2023.
//

import UIKit

protocol SettingsDelegate {
    func doneClicked(vm : SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {

    private var settingsViewModel = SettingsViewModel()
    var delegate : SettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Button Functions
    
    @IBAction func doneClicked(_ sender: Any) {
        if let delegate = delegate {
            delegate.doneClicked(vm: settingsViewModel)
            print("nabersin")
        }else {
            print("delegate problem")
        }
        
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - TableView Core Functions
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //uncheck all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingsViewModel.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        cell.textLabel?.text = settingsItem.displayName
        if settingsItem == settingsViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
}
