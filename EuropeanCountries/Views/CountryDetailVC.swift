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
    var countryDetail : CountryDetail?
    let infoView = UIView()
    var population = ECLabel(fontSize: 14, textWeight: .bold)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureUIElements()
        layoutUI()
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
        let starButton = UIBarButtonItem(image: Constants.star, style: .plain, target: self, action: #selector(addToSaved))
        starButton.tintColor = .systemGray
        navigationItem.rightBarButtonItem = starButton
        
        let goBackButton = UIBarButtonItem(image: Constants.arrow, style: .plain, target: self, action: #selector(dismissVC))
        goBackButton.tintColor = .systemGray
        navigationItem.leftBarButtonItem = goBackButton
    }
    
    func configureUIElements() {
        self.add(childVC: ECCountryInfoVC(), to: self.infoView)
        
        population.text = String("\(countryDetail?.population)")
    }
    
    func layoutUI() {
        view.addSubview(infoView)
        view.addSubview(population)
        infoView.translatesAutoresizingMaskIntoConstraints = false
        population.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoView.heightAnchor.constraint(equalToConstant: 300),
            
            population.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            population.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            population.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            population.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func addToSaved() {
        // Saved VC'deki tableView'da gozukecek.
    }
    
    @objc func dismissVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
