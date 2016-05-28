//
//  Employee.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 24-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

protocol EmployeeType: EntrantType {
    var firstName: String { get }
    var lastName: String { get }
    var streetAddress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
    var socialSecurityNumber: Int { get }
    var dateOfBirth: NSDate { get }
    var employeeType: HourlyEmployee { get }
}

enum HourlyEmployee {
    case FoodServices, RideServices, Maintenance
}

struct Employee: EmployeeType {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    var socialSecurityNumber: Int
    var dateOfBirth: NSDate
    var employeeType: HourlyEmployee
    
    var pass: Pass?
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?, socialSecurityNumber: Int?, dateOfBirth: String?, employeeType: HourlyEmployee?) throws {
        guard let first = firstName, let last = lastName else { throw ParkError.MissingName }
        
        guard let address = streetAddress, let city = city, let state = state, let zip = zipCode else { throw ParkError.MissingAddress }
        
        guard let security = socialSecurityNumber else { throw ParkError.MissingSecurityNumber }
        
        guard let birthDate = dateOfBirth else { throw ParkError.MissingDateOfBirth }
        
        guard let type = employeeType else { throw ParkError.MissingType }
        
        self.firstName = first
        self.lastName = last
        self.streetAddress = address
        self.city = city
        self.state = state
        self.zipCode = zip
        self.socialSecurityNumber = security
        self.dateOfBirth = dateFormatter.dateFromString(birthDate)!
        self.employeeType = type
    }
}