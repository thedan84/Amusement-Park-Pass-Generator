//
//  ViewController.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 20-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    //MARK: - Properties
    let kiosk = Kiosk()
    var guest: Entrant?
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Uncomment to get a simple 'Classic' guest
        
        do {
            let classicGuest = try Guest(dateOfBirth: nil, guestType: .classic)
            
            self.guest = classicGuest
            
        } catch {
            print(error)
        }
 
        
        //Uncomment to get a 'VIP' guest
        /*
        do {
            let vip = try Guest(dateOfBirth: nil, guestType: .VIP)
            
            self.guest = vip
            
        } catch {
            print(error.localizedDescription)
        }
        */
        
        //Uncomment to get a 'Free Child' guest
        /*
        do {
            let freeChild = try Guest(dateOfBirth: "05/29/2014", guestType: .FreeChild)
            
            self.guest = freeChild
            
        } catch {
            print(error.localizedDescription)
        }
        */
        
        //Uncomment to get an error with the initialization of a 'Free Child' guest, note that the error from the swipe method isn't called because the entrant won't get initialized
        /*
        do {
            let freeChildError = try Guest(dateOfBirth: "05/29/2000", guestType: .FreeChild)
            
            self.guest = freeChildError
            
        } catch ParkError.ChildOlderThanFive {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        */
        
        //Uncomment to get a 'Maintenance' employee
        /*
        do {
            let maintenance = try Employee(firstName: "Joe", lastName: "Smith", streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 4000, socialSecurityNumber: 3000, dateOfBirth: "05/29/1999", employeeType: .Maintenance)
            
            self.guest = maintenance
            
        } catch {
            print(error.localizedDescription)
        }
        */
        
        //Uncomment to get an error while initializing a 'Food Service' employee
        /*
        do {
            let foodServiceError = try Employee(firstName: nil, lastName: nil, streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 4000, socialSecurityNumber: 8000, dateOfBirth: "05/29/1998", employeeType: .FoodServices)
         
            self.guest = foodServiceError
         
        } catch ParkError.MissingName {
            print(error.localizedDescription)
        } catch {
            print(error)
        }
         */
        
        //Uncomment to get a 'Ride Services' employee
        /*
        do {
            let rideService = try Employee(firstName: "Joe", lastName: "Smith", streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 3000, socialSecurityNumber: 30000, dateOfBirth: "05/29/2001", employeeType: .RideServices)
         
            self.guest = rideService
         
        } catch {
            print(error.localizedDescription)
        }
        */
        
        //Uncomment to get a 'Shift Manager'
        /*
        do {
            let shiftManager = try Manager(firstName: "Joe", lastName: "Smith", streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 3000, socialSecurityNumber: 4000, dateOfBirth: "05/29/1980", managerType: .ShiftManager)
         
            self.guest = shiftManager
         
        } catch {
            print(error.localizedDescription)
        }
        */
        
        //Uncomment to get an error while initializing a 'General Manager'
        /*
        do {
            let generalManager = try Manager(firstName: "Joe", lastName: "Smitch", streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: 6000, dateOfBirth: "05/29/2010", managerType: .GeneralManager)
         
            self.guest = generalManager
         
        } catch ParkError.MissingAddress {
            print(error.localizedDescription)
        } catch {
            print(error.localizedDescription)
        }
        */
        
        //Uncomment to get a 'Senior Manager'
        /*
        do {
            let seniorManager = try Manager(firstName: "Joe", lastName: "Smith", streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 5000, socialSecurityNumber: 4000, dateOfBirth: "05/29/1989", managerType: .SeniorManager)
         
            self.guest = seniorManager
         
        } catch {
            print(error.localizedDescription)
        }
        */
        
        //Uncomment to swipe the guest's pass at an amusement area
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forArea: .AmusementAreas)
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
         */
        
        //Uncomment to swipe the guest's pass at a kitchen area
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forArea: .KitchenAreas)
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swip the guest's pass at a ride control area
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forArea: .RideControlAreas)
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swipe the guest's pass at a maintenance area
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forArea: .MaintenanceAreas)
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swipe the guest's pass at an office area
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forArea: .OfficeAreas)
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swipe the guest's pass at a ride
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forRide: .AllRides)
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swipe the guest's pass to skip ride lines
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forRide: .SkipAllRideLines)
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swipe the guest's pass to receive a 10% discount on food
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forDiscount: .DiscountOnFood(discount: 10))
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swipe the guest's pass to receive a 15% discount on food
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forDiscount: .DiscountOnFood(discount: 15))
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swipe the guest's pass to receive a 25% discount on food
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forDiscount: .DiscountOnFood(discount: 25))
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swipe the guest's pass to receive a 20% discount on merchandise
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forDiscount: .DiscountOnMerchandise(discount: 20))
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
        
        //Uncomment to swipe the guest's pass to receive a 25% discount on merchandise
        /*
        if var guest = self.guest {
            let pass = self.kiosk.createPassForEntrant(guest)
            guest.pass = pass
            
            do {
                try guest.swipePass(forDiscount: .DiscountOnMerchandise(discount: 25))
            } catch ParkError.MissingPass {
                print(error.localizedDescription)
            } catch {
                print(error.localizedDescription)
            }
        }
        */
    }
}

