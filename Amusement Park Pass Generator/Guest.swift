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
    var type: GuestType
    
    var pass: Pass?
    
    init(dateOfBirth: String?, guestType: GuestType) throws {
        
        func isYoungerThanFiveYearsOld(birthyear: NSDate) -> Bool {
            let today = NSDate()
            let calendar = NSCalendar.currentCalendar()
            let components = calendar.components(.Year, fromDate: birthyear, toDate: today, options: .MatchFirst)
            
            if components.year <= 5 {
                return true
            } else {
                return false
            }
        }
        
        switch guestType {
        case .FreeChild:
            guard let birthday = dateOfBirth else { throw ParkError.MissingDateOfBirth }
            
            let birthyear = dateFormatter.dateFromString(birthday)
            
            if isYoungerThanFiveYearsOld(birthyear!) {
                self.type = .FreeChild
            } else {
                throw ParkError.ChildOlderThanFive
            }
            
            
            if isYoungerThanFiveYearsOld(birthyear!) {
                self.type = .FreeChild
            } else {
                self.type = .Classic
            }
            
        default: self.type = guestType
            
        }
    }
}