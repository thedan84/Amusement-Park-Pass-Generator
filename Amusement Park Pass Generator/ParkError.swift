//
//  ParkError.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 24-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

//ErrorType enum
enum ParkError: Error {
    case missingName
    case missingAddress
    case missingSecurityNumber
    case missingDateOfBirth
    case missingType
    case missingPass
    case childOlderThanFive
    
    var localizedDescription: String {
        switch self {
        case .missingName: return "Your name is missing"
        case .missingAddress: return "Your address is missing"
        case .missingSecurityNumber: return "Your SSN is missing"
        case .missingDateOfBirth: return "Your date of birth is missing"
        case .missingType: return "Please define the type"
        case .missingPass: return "Please get a pass"
        case .childOlderThanFive: return "You are too old."
        }
    }
}
