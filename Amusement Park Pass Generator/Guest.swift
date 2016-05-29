//
//  Guest.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 24-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

//Enum with the different types of guests
enum GuestType {
    case Classic, VIP, FreeChild
}

struct Guest: EntrantType {
    //MARK: - Properties
    var type: GuestType
    var birthday: NSDate?
    var pass: Pass?
    
    //MARK: - Initialization
    init(dateOfBirth: String?, guestType: GuestType) throws {
        
        //Helper method to determine if the guest is younger than five years old and allowed to enter as a 'Free Child' guest
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
            
            self.birthday = birthyear
            
            if isYoungerThanFiveYearsOld(birthyear!) {
                self.type = .FreeChild
            } else {
                self.type = .Classic
                throw ParkError.ChildOlderThanFive
            }
            
        default: self.type = guestType
            
        }
    }
}