//
//  ViewController.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 20-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    let kiosk = Kiosk()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Uncomment to get a simple 'Classic' guest
        /*
        do {
            var classicGuest = try Guest(dateOfBirth: nil, guestType: .Classic)
            
            let pass = kiosk.createPassForEntrant(classicGuest)
            classicGuest.pass = pass
            
            do {
               try classicGuest.swipePass(forArea: .AmusementAreas)
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        */
        
        //Uncomment to get a 'VIP' guest
        /*
        do {
            let vip = try Guest(dateOfBirth: nil, guestType: .VIP)
        } catch {
            print(error)
        }
        */
        
        //Uncomment to get a 'Free Child' guest
        /*
        do {
            let freeChild = try Guest(dateOfBirth: "05/29/2014", guestType: .FreeChild)
        } catch {
            print(error)
        }
        */
        
        //Uncomment to get an error with the initialization of a 'Free Child' guest, note that the error from the swipe method isn't called because the entrant won't get initialized
        
        /*
        do {
            var freeChildError = try Guest(dateOfBirth: "05/29/2000", guestType: .FreeChild)
            
            let pass = kiosk.createPassForEntrant(freeChildError)
            freeChildError.pass = pass
            
            do {
                try freeChildError.swipePass(forArea: .AmusementAreas)
            } catch ParkError.ChildOlderThanFive {
                print("Sorry, your child is older than five")
            } catch {
                print(error)
            }
            
        } catch ParkError.ChildOlderThanFive {
            print("Sorry, your kid is too old!")
        } catch {
            print(error)
        }
         */
        
        
        //Uncomment to get a 'Maintenance' employee
        /*
        do {
            let maintenance = try Employee(firstName: "Joe", lastName: "Smith", streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 4000, socialSecurityNumber: 3000, dateOfBirth: "05/29/1999", employeeType: .Maintenance)
        } catch {
            print(error)
        }
        */
        
        //Uncomment to get an error while initializing a 'Food Service' employee
        /*
        do {
            let foodServiceError = try Employee(firstName: nil, lastName: nil, streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 4000, socialSecurityNumber: 8000, dateOfBirth: "05/29/1998", employeeType: .FoodServices)
        } catch ParkError.MissingName {
            print("No name was provided")
        } catch {
            print(error)
        }
         */
        
        //Uncomment to get a 'Ride Services' employee
        /*
        do {
            let rideService = try Employee(firstName: "Joe", lastName: "Smith", streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 3000, socialSecurityNumber: 30000, dateOfBirth: "05/29/2001", employeeType: .RideServices)
        } catch {
            print(error)
        }
        */
        
        //Uncomment to get a 'Shift Manager'
        /*
        do {
            let shiftManager = try Manager(firstName: "Joe", lastName: "Smith", streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 3000, socialSecurityNumber: 4000, dateOfBirth: "05/29/1980", managerType: .ShiftManager)
        } catch {
            print(error)
        }
        */
        
        //Uncomment to get an error while initializing a 'General Manager'
        /*
        do {
            let generalManager = try Manager(firstName: "Joe", lastName: "Smitch", streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: 6000, dateOfBirth: "05/29/2010", managerType: .GeneralManager)
        } catch ParkError.MissingAddress {
            print("Please provide an address")
        } catch {
            print(error)
        }
        */
        
        //Uncomment to get a 'Senior Manager'
        /*
        do {
            let seniorManager = try Manager(firstName: "Joe", lastName: "Smith", streetAddress: "SomeStreet", city: "SomeCity", state: "SomeState", zipCode: 5000, socialSecurityNumber: 4000, dateOfBirth: "05/29/1989", managerType: .SeniorManager)
        } catch {
            print(error)
        }
        */
    }
}

