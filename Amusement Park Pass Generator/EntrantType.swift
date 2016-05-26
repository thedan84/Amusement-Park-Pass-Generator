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
    func swipePass()
}