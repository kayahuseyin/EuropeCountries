//
//  HomeVC.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    let tableView = UITableView()
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Countries"
        
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCountryList()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        

        tableView.frame = view.bounds
        
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.reuseID)
    }
    
    
    func getCountryList() {
        NetworkManager.shared.getCountries { countries, errorMessage in
            guard let countries = countries else {
                print("olmadi be knk")
                return
            }
            self.countries = countries
            //print(self.countries)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
    
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(countries.count)
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.reuseID) as! HomeCell
        let country = countries[indexPath.row]
        cell.set(country: country)
        
        return cell
    }
    
    
    
}
