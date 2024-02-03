//
//  Network.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "https://restcountries.com/v3.1/region/europe"

    private init() {}
    
    func getCountries(completed: @escaping ([Country]?, String?) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            completed(nil, "This is a invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, "Unable to complete your request. Please try again.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server, Please try again.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([Country].self, from: data)
                completed(countries, nil)
            } catch {
                completed(nil, "The data received from the server was invalid.")
            }
        }
        task.resume()
    }
    
    
    func getCountryDetails(completed: @escaping ([CountryDetail]?, String?) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            completed(nil, "This is a invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(nil, "Unable to complete your request. Please try again.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server, Please try again.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode([CountryDetail].self, from: data)
                completed(countries, nil)
            } catch {
                completed(nil, "The data received from the server was invalid.")
            }
        }
        task.resume()
    }
        
}
