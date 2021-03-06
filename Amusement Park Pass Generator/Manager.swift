//
//  Manager.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 24-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

//Enum to differentiate between the various Manager types
enum ManagementTier {
    case shiftManager, generalManager, seniorManager
}

struct Manager: Employee {
    
    //MARK: - Properties
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    var socialSecurityNumber: Int
    var dateOfBirth: Date
    var managerType: ManagementTier
    
    var pass: ParkPass?
    
    //MARK: - Initialization
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?, socialSecurityNumber: Int?, dateOfBirth: String?, managerType: ManagementTier?) throws {
        guard let first = firstName, let last = lastName else { throw ParkError.missingName }
        
        guard let address = streetAddress, let city = city, let state = state, let zip = zipCode else { throw ParkError.missingAddress }
        
        guard let security = socialSecurityNumber else { throw ParkError.missingSecurityNumber }
        
        guard let birthDate = dateOfBirth else { throw ParkError.missingDateOfBirth }
        
        guard let type = managerType else { throw ParkError.missingType }
        
        self.firstName = first
        self.lastName = last
        self.streetAddress = address
        self.city = city
        self.state = state
        self.zipCode = zip
        self.socialSecurityNumber = security
        self.dateOfBirth = dateFormatter.date(from: birthDate)!
        self.managerType = type
    }
}
