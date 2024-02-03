//
//  ECError.swift
//  EuropeanCountries
//
//  Created by Hüseyin Kaya on 3.02.2024.
//

import Foundation

enum ECError: String, Error {
    case invalidCountry = "This country created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please try again."
    case invalidResponse = "Invalid response from the server, Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToSave = "There was an error saving this user. Please try again."
}
