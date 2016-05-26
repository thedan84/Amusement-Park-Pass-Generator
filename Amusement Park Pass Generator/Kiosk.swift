//
//  Kiosk.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 26-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

protocol KioskType {
    func createPassForEntrant(entrant: EntrantType) -> Pass
    mutating func validateAreaAccessForPass(pass: Pass, andArea area: AreaAccess) -> Bool
}

struct Kiosk: KioskType {
    
    var swipeCount = 0
    
    func createPassForEntrant(entrant: EntrantType) -> Pass {
        return Pass(entrant: entrant)
    }
    
    func validateAreaAccessForPass(pass: Pass, andArea area: AreaAccess) -> Bool {
        for access in pass.areaAccess {
            if access == area {
                return true
            }
        }
        return false
    }
    
    func validateRideAccessForPass(pass: Pass, andRide ride: RideAccess) -> Bool {
        for access in pass.rideAccess {
            if access == ride {
                return true
            }
        }
        return false
    }
    
    func validateDiscountAccessForPass(pass: Pass, andDiscount discount: Discount) -> Bool {
        if let access = pass.discountAccess {
            for discountAccess in access {
                if discountAccess == discount {
                    return true
                }
            }
        }
        return false
    }
    
}