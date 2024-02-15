//
//  ECCountryInfoVC.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 15.02.2024.
//

import UIKit

class ECCountryInfoVC: UIViewController {
    
    var countryFlagImageView = ECCountryFlagImageView(frame: .zero)
    var countryPopulation = ECLabel(fontSize: 14, textWeight: .bold)
    
    var country : CountryDetail!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
        addSubViews()
        layoutUI()
    }
    
    
    func configureUIElements() {
        //countryFlagImageView.downloadImage(from: country.flags.png)
        //countryPopulation.text = String(country.population)
    }
    
    
    func addSubViews() {
        view.addSubview(countryFlagImageView)
        view.addSubview(countryPopulation)
    }
    
    func layoutUI() {
        
        NSLayoutConstraint.activate([
            countryFlagImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countryFlagImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countryFlagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countryFlagImageView.heightAnchor.constraint(equalToConstant: 200),
            
            countryPopulation.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            countryPopulation.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            countryPopulation.topAnchor.constraint(equalTo: countryFlagImageView.bottomAnchor, constant: 20),
            countryPopulation.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
}
