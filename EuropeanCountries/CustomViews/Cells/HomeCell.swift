//
//  SavedCell.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import UIKit

class HomeCell: UITableViewCell { // Degistir

    static let reuseID = "HomeCell"
    var countryName = ECLabel(fontSize: 14, textWeight: .regular)
    var starButton = ECButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(country: Country) {
        countryName.text = country.name.common
    }
    
    
    private func configureCell() {
        addSubview(countryName)
        addSubview(starButton)
        layer.cornerRadius = 8
        layer.borderWidth = 2
        layer.borderColor = countryName.textColor.cgColor // Adapt the borderColor to light/dark mode
        
        NSLayoutConstraint.activate([
            countryName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countryName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            countryName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            countryName.heightAnchor.constraint(equalToConstant: 40),
            
            starButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            starButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            starButton.heightAnchor.constraint(equalToConstant: 30),
            starButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
