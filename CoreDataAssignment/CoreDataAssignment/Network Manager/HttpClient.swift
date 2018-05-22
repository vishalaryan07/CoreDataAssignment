//
//  HttpClient.swift
//  CoreDataAssignment
//
//  Created by Vishal Ranjan on 09/05/18.
//  Copyright © 2018 Vishal Ranjan. All rights reserved.
//

import UIKit
import SwiftyJSON

class HttpClient: NSObject {
    static let sharedInstance = HttpClient()
    fileprivate override init() {}
    
    func postRequestToServer(apiName: String, params: [String: String], headers: [String: String]?, completionHandler: @escaping (_ responseJSON: JSON?, _ isSuccess: Bool, _ error: String) -> Void) {
        guard let postURL  = URL(string: apiName) else { return }
        //create the request
        var request = URLRequest(url: postURL)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        //making the request
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
//                print(response)
            }
            if let tempData = data {
                do {
                    let parsedData = try JSON(data: tempData)
//                    print(parsedData)
                    DispatchQueue.main.async {
                        completionHandler(parsedData, true, "")
                    }
                } catch {
                    print(error)
                }
            } else {
                if let error  = error {
                    let errorMsg = error.localizedDescription
                    completionHandler(nil, false, errorMsg)
                    return
                } else {
                    completionHandler(nil, false, "Failed to fetch response")
                }
            }
        }.resume()
    }
    
    func getRequestToServer(_ apiName: String, params: [String: AnyObject]?, headers: String, completionHandler: @escaping (_ responseJSON: JSON?, _ isSuccess: Bool, _ error: String) -> Void) {
        //header encoded in base64
//        let header = headers.data(using: String.Encoding.utf8)!
//        let base64LoginData = header.base64EncodedString()
        
        guard let getURL = URL(string: apiName) else { return }
        //create the request
        var request = URLRequest(url: getURL)
        request.httpMethod = "GET"
//        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Basic \(base64LoginData)", forHTTPHeaderField: "Authorization")
        request.setValue(headers, forHTTPHeaderField: "Authorization")
        
        //making the request
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let tempData = data {
                do {
                    let parsedData = try JSON(data: tempData)
//                    print(parsedData)
                    DispatchQueue.main.async {
                        completionHandler(parsedData, true, "")
                    }
                } catch {
                    print(error)
                }
            } else {
                if let error = error {
                    let errorMsg = error.localizedDescription
                    completionHandler(nil, false, errorMsg)
                    return
                } else {
                    completionHandler(nil, false, "Failed to fetch response")
                }
            }
        }.resume()
    }
}
