//
//  GuestType.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 20-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

//The EntrantType protocol to wich every entrant has to conform
protocol Entrant {
    var pass: ParkPass? { get set }
    func swipePass(forArea area: AreaAccess) throws
    func swipePass(forRide ride: RideAccess) throws
    func swipePass(forDiscount discount: Discount) throws
}

//Extension to give a default swipe implementation to every type which conforms to the EntrantType protocol
extension Entrant {
    
    //Swipe the pass at an area, to get access to amusement or maintenance areas
    func swipePass(forArea area: AreaAccess) throws {
        guard let pass = pass else { throw ParkError.missingPass }
        
        let kiosk = Kiosk()

        if kiosk.validateAreaAccessForPass(pass, andArea: area) {
            print("Access Granted to: \(area)")
            Sound.playAccessGrantedSound()
            hasGuestBirthday()
        } else {
            print("Access NOT Granted to :\(area)")
            Sound.playAccessDeniedSound()
        }
    }
    
    //Swipe the pass at a ride, to get access to rides or skip lines
    func swipePass(forRide ride: RideAccess) throws {
        guard let pass = pass else { throw ParkError.missingPass }
        
        let kiosk = Kiosk()
        
        if kiosk.validateRideAccessForPass(pass, andRide: ride) {
            print("Access Granted to: \(ride)")
            Sound.playAccessGrantedSound()
            hasGuestBirthday()
        } else {
            print("Access NOT Granted to: \(ride)")
            Sound.playAccessDeniedSound()
        }
    }
    
    //Swipe the pass at a shop or eatery, to get discounts on food and/or merchandise
    func swipePass(forDiscount discount: Discount) throws {
        guard let pass = pass else { throw ParkError.missingPass }
        
        let kiosk = Kiosk()
        
        if kiosk.validateDiscountAccessForPass(pass, andDiscount: discount) {
            switch discount {
            case let .discountOnFood(value) :
                print("Discount Granted for \(value)% off of food")
                Sound.playAccessGrantedSound()
                hasGuestBirthday()
            case let .discountOnMerchandise(value):
                print("Discount Granted for \(value)% off of merchandise")
                Sound.playAccessGrantedSound()
                hasGuestBirthday()
            }
        } else {
            switch discount {
            case let .discountOnFood(value):
                print("Discount NOT Granted for \(value)% off of food")
                Sound.playAccessDeniedSound()
            case let .discountOnMerchandise(value):
                print("Discount NOT Granted for \(value)% off of merchandise")
                Sound.playAccessDeniedSound()
            }
        }
    }
    
    //Private function to check if the entrant's birthday is on the day
    fileprivate func hasGuestBirthday() {
        switch self {
        case let guest as Guest:
            if let birthday = guest.birthday {
                
                let todayComponents = Calendar.current.dateComponents([.month, .day], from: Date())
                let birthdayComponents = Calendar.current.dateComponents([.month, .day], from: birthday as Date)
                
                if todayComponents.month == birthdayComponents.month && todayComponents.day == birthdayComponents.day {
                    print("Happy Birthday")
                }
                
            }
        case let employee as ParkEmployee:
            let birthday = employee.dateOfBirth
            
            let todayComponents = Calendar.current.dateComponents([.month, .day], from: Date())
            let birthdayComponents = Calendar.current.dateComponents([.month, .day], from: birthday as Date)
            
            if todayComponents.month == birthdayComponents.month && todayComponents.day == birthdayComponents.day {
                print("Happy Birthday")
            }
        case let manager as Manager:
            let birthday = manager.dateOfBirth
            
            let todayComponents = Calendar.current.dateComponents([.month, .day], from: Date())
            let birthdayComponents = Calendar.current.dateComponents([.month, .day], from: birthday as Date)
            
            if todayComponents.month == birthdayComponents.month && todayComponents.day == birthdayComponents.day {
                print("Happy Birthday")
            }
            
        default: break
        }
    }
}
