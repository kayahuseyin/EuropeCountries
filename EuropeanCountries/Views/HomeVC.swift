//
//  HomeVC.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    let tableView = UITableView()
    let countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        
        NetworkManager.shared.getCountries { countries, errorMessage in
            guard let countries = countries else {
                print("olmadi be knk")
                return
            }
            print(countries)
        }
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(SavedCell.self, forCellReuseIdentifier: SavedCell.reuseID)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.reuseID) as! SavedCell
        let country = countries[indexPath.row]
        cell.set(country: country)
        
        return cell
    }

    
}
