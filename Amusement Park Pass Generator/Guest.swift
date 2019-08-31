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
    case classic, vip, freeChild
}

struct Guest: Entrant {
    //MARK: - Properties
    var type: GuestType
    var birthday: Date?
    var pass: ParkPass?
    
    //MARK: - Initialization
    init(dateOfBirth: String?, guestType: GuestType) throws {
        
        //Helper method to determine if the guest is younger than five years old and allowed to enter as a 'Free Child' guest
        func isYoungerThanFiveYearsOld(_ birthyear: Date) -> Bool {
            let today = Date()
            let calendar = Calendar.current
            let components = (calendar as NSCalendar).components(.year, from: birthyear, to: today, options: .matchFirst)
            
            if components.year! <= 5 {
                return true
            } else {
                return false
            }
        }
        
        switch guestType {
        case .freeChild:
            guard let birthday = dateOfBirth else { throw ParkError.missingDateOfBirth }
            
            let birthyear = dateFormatter.date(from: birthday)
            
            self.birthday = birthyear
            
            if isYoungerThanFiveYearsOld(birthyear!) {
                self.type = .freeChild
            } else {
                self.type = .classic
                throw ParkError.childOlderThanFive
            }
            
        default: self.type = guestType
        }
    }
}
