//
//  Guest.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 24-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

enum GuestType {
    case Classic
    case VIP
    case FreeChild
    
    func accessGranted() -> (area: [AreaAccess], ride: [RideAccess], discount: [Discount]?) {
        switch self {
        case .Classic:
            return (area: [.AmusementAreas], ride: [.AllRides], discount: nil)
        case .VIP:
            return (area: [.AmusementAreas], ride: [.AllRides, RideAccess.SkipAllRideLines], discount: [.DiscountOnFood(discount: 10), .DiscountOnMerchandise(discount: 20)])
        case .FreeChild:
            return (area: [.AmusementAreas], ride: [.AllRides], discount: nil)
        }
    }
}

struct Guest: EntrantType {
    
    var dateOfBirth: NSDate?
    var type: GuestType
    
    init(dateOfBirth: NSDate?, guestType: GuestType) throws {
        switch guestType {
        case .FreeChild:
            guard let birthday = dateOfBirth else { throw ParkError.MissingDateOfBirth }
            
            self.dateOfBirth = birthday
            self.type = guestType
            
        default: self.type = guestType
        }
    }
    
    func swipePass() {
        
    }
}