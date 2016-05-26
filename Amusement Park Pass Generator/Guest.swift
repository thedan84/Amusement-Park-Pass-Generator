//
//  Guest.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 24-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

enum GuestType {
    case Classic, VIP, FreeChild
}

struct Guest: EntrantType {
    var dateOfBirth: NSDate?
    var type: GuestType
    
    var pass: Pass?
    
    init(dateOfBirth: String?, guestType: GuestType) throws {
        switch guestType {
        case .FreeChild:
            guard let birthday = dateOfBirth else { throw ParkError.MissingDateOfBirth }
            
            self.dateOfBirth = dateFormatter.dateFromString(birthday)
            self.type = guestType
            
        default: self.type = guestType
        }
    }
    
    func swipePass() {
        
    }
}