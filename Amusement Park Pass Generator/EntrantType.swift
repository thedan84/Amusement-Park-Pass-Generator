//
//  GuestType.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 20-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation

protocol EntrantType {
    func swipePass()
}

enum AreaAccess {
    case AmusementAreas, KitchenAreas, RideControlAreas, MaintenanceAreas, OfficeAreas
}

enum RideAccess {
    case AllRides, SkipAllRideLines
}

enum Discount {
    case DiscountOnFood(discount: Int)
    case DiscountOnMerchandise(discount: Int)
}
