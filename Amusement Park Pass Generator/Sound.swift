//
//  Sound.swift
//  Amusement Park Pass Generator
//
//  Created by Dennis Parussini on 28-05-16.
//  Copyright © 2016 Dennis Parussini. All rights reserved.
//

import Foundation
import AudioToolbox

struct Sound {
    
    //MARK: - Properties
    private static let accessGranted: SystemSoundID = {
       let pathToSoundFile = Bundle.main.url(forResource: "AccessGranted", withExtension: "wav")!
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(pathToSoundFile as CFURL, &soundID)
        return soundID
    }()
    
    private static let accessDenied: SystemSoundID = {
        let pathToSoundFile = Bundle.main.url(forResource: "AccessDenied", withExtension: "wav")!
        var soundID: SystemSoundID = 1
        AudioServicesCreateSystemSoundID(pathToSoundFile as CFURL, &soundID)
        return soundID
    }()
    
    //MARK: - Private intializer
    private init() {}
    
    //MARK: - Play sound functions
    static func playAccessGrantedSound() {
        AudioServicesPlayAlertSound(accessGranted)
    }
    
    static func playAccessDeniedSound() {
        AudioServicesPlayAlertSound(accessDenied)
    }
}
