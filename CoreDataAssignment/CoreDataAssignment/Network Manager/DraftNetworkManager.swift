//
//  DraftNetworkManager.swift
//  CoreDataAssignment
//
//  Created by Vishal Ranjan on 11/05/18.
//  Copyright © 2018 Vishal Ranjan. All rights reserved.
//

import UIKit
import SwiftyJSON
import CoreData

class DraftNetworkManager: NSObject {
    
    func fetchDataFromServer(completionHandler: @escaping (_ response: [DraftOrder]?, _ isSucess: Bool, _ error: String) -> Void) {
        let url = String("\(Utility.kServerBaseURL)/get_draft_order")
        let token = Utility.sharedInstance.getAccessToken()
        HttpClient.sharedInstance.getRequestToServer(url, params: nil, headers: token) { (responseJSON, isSuccess, error) in
            if isSuccess == true {
                self.parseResponseData(response: responseJSON, completionHandler: completionHandler)
            } else {
                completionHandler(nil, false, error)
            }
        }
    }
    
    func parseResponseData(response: JSON?, completionHandler: @escaping (_ dataArray: [DraftOrder]?, _ isSuccess: Bool, _ error: String) -> Void) {
        
       DraftManagedObject.sharedInstance.deleteAllDrafts()
        var tmpDraftOrderArray = [DraftOrder]()
        let parsedDataArray = response?["data"].array!
        
        for (_, tmpDraftOrderObj) in (parsedDataArray?.enumerated())! {
            
            let draftObj = DraftOrder.mr_createEntity() as! DraftOrder
            draftObj.initializeWithDictionary(draftDictionary: tmpDraftOrderObj)
            tmpDraftOrderArray.append(draftObj)
            DraftManagedObject.sharedInstance.saveContext()
        }
        DispatchQueue.main.async {
            completionHandler(tmpDraftOrderArray, true, "")
        }
    }
}
