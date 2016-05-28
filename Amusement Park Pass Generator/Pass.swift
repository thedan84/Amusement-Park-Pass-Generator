//
//  Pass.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 26-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import UIKit

protocol PassType {
    var image: UIImage? { get }
    var type: String? { get }
    var entrantName: String? { get }
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discountAccess: [Discount]? { get }
}

struct Pass: PassType {
    var image: UIImage?
    var type: String?
    var entrantName: String?
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [Discount]?
    
    enum Type: String {
        case ClassicGuestPass = "Classic Guest Pass"
        case ChildGuestPass = "Child Guest Pass"
        case VIPGuestPass = "VIP Guest Pass"
        case FoodServicePass = "Food Services Pass"
        case RideServicePass = "Ride Services Pass"
        case MaintenancePass = "Maintenance Services Pass"
        case ShiftManagerPass = "Shift Manager Pass"
        case GeneralManagerPass = "General Manager Pass"
        case SeniorManagerPass = "Senior Manager Pass"
    }
    
    init(entrant: EntrantType) {
        switch entrant {
        case let guest as Guest:
            self.entrantName = nil
            
            switch guest.type {
            case .Classic:
                self.type = Type.ClassicGuestPass.rawValue
            case .VIP:
                self.type = Type.VIPGuestPass.rawValue
            case .FreeChild:
                self.type = Type.ChildGuestPass.rawValue
            }
            
        case let employee as Employee:
            self.entrantName = "\(employee.firstName) \(employee.lastName)"
            
            switch employee.employeeType {
            case .FoodServices:
                self.type = Type.FoodServicePass.rawValue
            case .RideServices:
                self.type = Type.RideServicePass.rawValue
            case .Maintenance:
                self.type = Type.MaintenancePass.rawValue
            }
            
        case let manager as Manager:
            self.entrantName = "\(manager.firstName) \(manager.lastName)"
            
            switch manager.managerType {
            case .GeneralManager:
                self.type = Type.GeneralManagerPass.rawValue
            case .SeniorManager:
                self.type = Type.SeniorManagerPass.rawValue
            case .ShiftManager:
                self.type = Type.ShiftManagerPass.rawValue
            }
        default: break
        }
        
        self.areaAccess = AreaAccess.validateAccessForEntrant(entrant)
        self.rideAccess = RideAccess.validateAccessForEntrant(entrant)
        self.discountAccess = Discount.validateAccessForEntrant(entrant)
    }
}

enum AreaAccess {
    case AmusementAreas, KitchenAreas, RideControlAreas, MaintenanceAreas, OfficeAreas
    
    static func validateAccessForEntrant(entrant: EntrantType) -> [AreaAccess] {
        var access = [AreaAccess]()
        
        switch entrant {
        case is Guest: access = [.AmusementAreas]
        case let employee as Employee:
            switch employee.employeeType {
            case .FoodServices: access = [.AmusementAreas, .KitchenAreas]
            case .RideServices: access = [.AmusementAreas, .RideControlAreas]
            case .Maintenance: access = [.AmusementAreas, .KitchenAreas, .RideControlAreas, .MaintenanceAreas]
            }
        case is Manager: access = [.AmusementAreas, .KitchenAreas, .RideControlAreas, .MaintenanceAreas, .OfficeAreas]
        default: break
        }
        
        return access
    }
}

enum RideAccess {
    case AllRides, SkipAllRideLines
    
    static func validateAccessForEntrant(entrant: EntrantType) -> [RideAccess] {
        var access = [RideAccess]()
        
        switch entrant {
        case let guest as Guest:
            switch guest.type {
            case .Classic, .FreeChild: access = [.AllRides]
            case .VIP: access = [.AllRides, .SkipAllRideLines]
            }
        case is Employee: access = [.AllRides]
        case is Manager: access = [.AllRides]
        default: break
        }
        
        return access
    }
}

enum Discount {
    case DiscountOnFood(discount: Int)
    case DiscountOnMerchandise(discount: Int)
    
    static func validateAccessForEntrant(entrant: EntrantType) -> [Discount]? {
        var access: [Discount]?
        
        switch entrant {
        case let guest as Guest:
            switch guest.type {
            case .VIP: access = [.DiscountOnFood(discount: 10), .DiscountOnMerchandise(discount: 20)]
            default: access = nil
            }
        case is Employee: access = [.DiscountOnFood(discount: 15), .DiscountOnMerchandise(discount: 25)]
        case is Manager: access = [.DiscountOnFood(discount: 25), .DiscountOnMerchandise(discount: 25)]
        default: break
        }
        
        return access
    }
    
}