//
//  Pass.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 26-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import UIKit

//The Pass protocol to which every Pass has to conform
protocol Pass {
    var image: UIImage? { get }
    var type: String? { get }
    var entrantName: String? { get }
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    var discountAccess: [Discount]? { get }
}

struct ParkPass: Pass {
    //MARK: - Properties
    var image: UIImage?
    var type: String?
    var entrantName: String?
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    var discountAccess: [Discount]?
    
    //MARK: - Helper enum
    //The Type enum provides the type of pass the entrant gets
    enum GuestType: String {
        case classicGuestPass = "Classic Guest Pass"
        case childGuestPass = "Child Guest Pass"
        case vipGuestPass = "VIP Guest Pass"
        case foodServicePass = "Food Services Pass"
        case rideServicePass = "Ride Services Pass"
        case maintenancePass = "Maintenance Services Pass"
        case shiftManagerPass = "Shift Manager Pass"
        case generalManagerPass = "General Manager Pass"
        case seniorManagerPass = "Senior Manager Pass"
    }
    
    //MARK: - Initialization
    //Initialization is done via the EntrantType protocol. Switches allow to intialize the Pass with the correct entrant type.
    init(entrant: Entrant) {
        switch entrant {
        case let guest as Guest:
            self.entrantName = nil
            
            switch guest.type {
            case .classic:
                self.type = GuestType.classicGuestPass.rawValue
            case .vip:
                self.type = GuestType.vipGuestPass.rawValue
            case .freeChild:
                self.type = GuestType.childGuestPass.rawValue
            }
            
        case let employee as ParkEmployee:
            self.entrantName = "\(employee.firstName) \(employee.lastName)"
            
            switch employee.employeeType {
            case .foodServices:
                self.type = GuestType.foodServicePass.rawValue
            case .rideServices:
                self.type = GuestType.rideServicePass.rawValue
            case .maintenance:
                self.type = GuestType.maintenancePass.rawValue
            }
            
        case let manager as Manager:
            self.entrantName = "\(manager.firstName) \(manager.lastName)"
            
            switch manager.managerType {
            case .generalManager:
                self.type = GuestType.generalManagerPass.rawValue
            case .seniorManager:
                self.type = GuestType.seniorManagerPass.rawValue
            case .shiftManager:
                self.type = GuestType.shiftManagerPass.rawValue
            }
        default: break
        }
        
        //Assign the right access to the properties
        self.areaAccess = AreaAccess.validateAccessForEntrant(entrant)
        self.rideAccess = RideAccess.validateAccessForEntrant(entrant)
        self.discountAccess = Discount.validateAccessForEntrant(entrant)
    }
}

//MARK: - Access Enums
//The AreaAccess enum holds the different areas and validates which entrant is allowed access to which area
enum AreaAccess {
    case amusementAreas, kitchenAreas, rideControlAreas, maintenanceAreas, officeAreas
    
    static func validateAccessForEntrant(_ entrant: Entrant) -> [AreaAccess] {
        var access = [AreaAccess]()
        
        switch entrant {
        case is Guest: access = [.amusementAreas]
        case let employee as ParkEmployee:
            switch employee.employeeType {
            case .foodServices: access = [.amusementAreas, .kitchenAreas]
            case .rideServices: access = [.amusementAreas, .rideControlAreas]
            case .maintenance: access = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas]
            }
        case is Manager: access = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas]
        default: break
        }
        
        return access
    }
}

//The RideAccess enum holds the different areas and validates which entrant is allowed access to which ride
enum RideAccess {
    case allRides, skipAllRideLines
    
    static func validateAccessForEntrant(_ entrant: Entrant) -> [RideAccess] {
        var access = [RideAccess]()
        
        switch entrant {
        case let guest as Guest:
            switch guest.type {
            case .classic, .freeChild: access = [.allRides]
            case .vip: access = [.allRides, .skipAllRideLines]
            }
        case is ParkEmployee: access = [.allRides]
        case is Manager: access = [.allRides]
        default: break
        }
        
        return access
    }
}

//The Discount enum holds the different areas and validates which entrant is allowed access to which discount
enum Discount {
    case discountOnFood(discount: Int)
    case discountOnMerchandise(discount: Int)
    
    static func validateAccessForEntrant(_ entrant: Entrant) -> [Discount]? {
        var access: [Discount]?
        
        switch entrant {
        case let guest as Guest:
            switch guest.type {
            case .vip: access = [.discountOnFood(discount: 10), .discountOnMerchandise(discount: 20)]
            default: access = nil
            }
        case is ParkEmployee: access = [.discountOnFood(discount: 15), .discountOnMerchandise(discount: 25)]
        case is Manager: access = [.discountOnFood(discount: 25), .discountOnMerchandise(discount: 25)]
        default: break
        }
        
        return access
    }
    
}
