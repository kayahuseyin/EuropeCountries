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
    let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)] // make title bold
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCountryList()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.titleTextAttributes = attributes
        title = "Countries"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.reuseID)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
    func getCountryList() {
        NetworkManager.shared.getCountries { countries, errorMessage in
            guard let countries = countries else {
                print("Error fetching countries")
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
        return countries.count * 2 - 1 //in order to prevent adding one more emptyCell after the last cell do - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.reuseID) as! HomeCell
            let countryIndex = indexPath.row / 2
            let country = countries[countryIndex]
            cell.set(country: country)
            
            return cell
        } else {
            let emptyCell = UITableViewCell()
            emptyCell.backgroundColor = .systemBackground
            emptyCell.selectionStyle = .none
            
            return emptyCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row % 2 == 0 {
            return 40
        }
        return 15
    }
    
}
