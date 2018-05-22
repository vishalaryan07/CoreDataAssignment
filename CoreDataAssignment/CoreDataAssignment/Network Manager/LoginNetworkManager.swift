//
//  LoginNetworkManager.swift
//  CoreDataAssignment
//
//  Created by Vishal Ranjan on 10/05/18.
//  Copyright © 2018 Vishal Ranjan. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginNetworkManager: NSObject {
    
    func loginToServer(_ userName: String, password: String, completionHandler: @escaping(_ token: String?, _ isSuccess: Bool, _ error: String) -> Void) {
        let url = String("\(Utility.kServerBaseURL)/user_login")
        let params = ["name": userName, "password": password]
        HttpClient.sharedInstance.postRequestToServer(apiName: url, params: params, headers: nil) { (responseJSON, isSuccess, error) in
            if isSuccess == true {
                self.parseResponseData(response: responseJSON, completionHandler: completionHandler)
            } else {
                completionHandler(nil, false, error)
            }
        }
    }
    
    func parseResponseData(response: JSON?, completionHandler: @escaping(_ token: String?, _ isSuccess: Bool, _ error: String) -> Void) {
        print(response!)
        let loginResponse = response?["data"].dictionary
        if loginResponse == nil {
            DispatchQueue.main.async {
                let errorMsg = response!["message"].rawString()
                completionHandler(nil, false, errorMsg!)
                return
            }
        } else {
            let tokenStr = loginResponse!["token"]?.rawString()
            DispatchQueue.main.async {
                completionHandler(tokenStr,true,"")
            }
        }
    }
}
