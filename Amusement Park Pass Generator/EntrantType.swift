//
//  GuestType.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 20-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

protocol EntrantType {
    var pass: Pass? { get set }
    func swipePass(pass: Pass?, forArea area: AreaAccess) throws
    func swipePass(pass: Pass?, forRide ride: RideAccess) throws
    func swipePass(pass: Pass?, forDiscount discount: Discount) throws
}

extension EntrantType {
    func swipePass(pass: Pass?, forArea area: AreaAccess) throws {
        guard let pass = pass else { throw ParkError.MissingPass }
        
        let kiosk = Kiosk()
        var sound = Sound()

        if kiosk.validateAreaAccessForPass(pass, andArea: area) {
            print("Access Granted to: \(area)")
            sound.playAccessGrantedSound()
        } else {
            print("Access NOT Granted to :\(area)")
            sound.playAccessDeniedSound()
        }
    }
    
    func swipePass(pass: Pass?, forRide ride: RideAccess) throws {
        guard let pass = pass else { throw ParkError.MissingPass }
        
        let kiosk = Kiosk()
        var sound = Sound()
        
        if kiosk.validateRideAccessForPass(pass, andRide: ride) {
            print("Access Granted to: \(ride)")
            sound.playAccessGrantedSound()
        } else {
            print("Access NOT Granted to: \(ride)")
            sound.playAccessDeniedSound()
        }
    }
    
    func swipePass(pass: Pass?, forDiscount discount: Discount) throws {
        guard let pass = pass else { throw ParkError.MissingPass }
        
        let kiosk = Kiosk()
        var sound = Sound()
        
        if kiosk.validateDiscountAccessForPass(pass, andDiscount: discount) {
            switch discount {
            case let .DiscountOnFood(value) :
                print("Discount Granted for \(value)% off of food")
                sound.playAccessGrantedSound()
            case let .DiscountOnMerchandise(value):
                print("Discount Granted for \(value)% off of merchandise")
                sound.playAccessGrantedSound()
            }
        } else {
            switch discount {
            case let .DiscountOnFood(value):
                print("Discount NOT Granted for \(value)% off of food")
                sound.playAccessDeniedSound()
            case let .DiscountOnMerchandise(value):
                print("Discount NOT Granted for \(value)% off of merchandise")
                sound.playAccessDeniedSound()
            }
        }
    }
}