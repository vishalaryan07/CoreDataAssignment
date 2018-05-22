//
//  Utility.swift
//  CoreDataAssignment
//
//  Created by Vishal Ranjan on 10/05/18.
//  Copyright © 2018 Vishal Ranjan. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

let AccessToken = "TOKEN"
let IsLoggedIN = "IS_LOGGEDIN"

class Utility: NSObject {
    static let sharedInstance = Utility.init()
    
    static let kServerBaseURL = "http://54.213.178.7"
    
    func setAccessToken (token: String) -> Void {
        KeychainWrapper.standard.set(token, forKey: AccessToken)
    }
    
    func getAccessToken() -> String {
        if let token = KeychainWrapper.standard.string(forKey: AccessToken) {
            return token
        }
        return ""
    }
    
    func setLoggedInValue(value: Bool) -> Void{
        UserDefaults.standard.set(value, forKey: IsLoggedIN)
    }
    
    func isLoggedIn() -> Bool {
        let value = UserDefaults.standard.bool(forKey: IsLoggedIN)
        if value == true {
            return value
        }
        return false
    }
    
    func clearCredentials() {
        KeychainWrapper.standard.removeObject(forKey: AccessToken)
        UserDefaults.standard.removeObject(forKey: IsLoggedIN)
    }

}
