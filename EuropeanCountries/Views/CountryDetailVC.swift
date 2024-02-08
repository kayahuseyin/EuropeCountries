//
//  CountryDetailVC.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 7.02.2024.
//

import UIKit

class CountryDetailVC: UIViewController {

    var country : Country?
    var countryDetails: [CountryDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCountryDetails()
    }
    
    
    func getCountryDetails() {
        NetworkManager.shared.getCountryDetails { [weak self] details, errorMessage in
            guard let self = self else { return }
            guard let details = details else {
                print("error fetching details")
                return
            }
            self.countryDetails = details
            print(self.countryDetails)
        }
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = country?.name.common
    }
}
