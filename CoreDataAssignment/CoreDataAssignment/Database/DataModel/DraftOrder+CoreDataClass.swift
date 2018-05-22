//
//  DraftOrder+CoreDataClass.swift
//  
//
//  Created by Vishal Ranjan on 11/05/18.
//
//

import Foundation
import CoreData
import UIKit
import SwiftyJSON

@objc(DraftOrder)
public class DraftOrder: NSManagedObject {
    
//    var draftOrderArray = [DraftOrder]()
    func initializeWithDictionary(draftDictionary : JSON) -> Void {

        self.dataId = ((draftDictionary["id"]) != JSON.null) ?  draftDictionary["id"].int32Value : 0
        self.orderDate =  ((draftDictionary["order_date"]) != JSON.null) ?  draftDictionary["order_date"].stringValue : "NA"
        self.orderQuantity = ((draftDictionary["order_quantity"]) != JSON.null) ?  draftDictionary["order_quantity"].int32Value : 0
        self.orderPrice = ((draftDictionary["order_price"]) != JSON.null) ?  draftDictionary["order_price"].doubleValue : 0.0
        self.orderForPrice = ((draftDictionary["oder_for_price"]) != JSON.null) ?  draftDictionary["oder_for_price"].doubleValue : 0.0
        self.orderTotalPrice = ((draftDictionary["order_total_price"]) != JSON.null) ?  draftDictionary["order_total_price"].doubleValue : 0.0
        self.orderStatus = ((draftDictionary["status"]) != JSON.null) ?  draftDictionary["status"].int32Value : 0
        self.orderForTableId = ((draftDictionary["order_for_table_id"]) != JSON.null) ?  draftDictionary["order_for_table_id"].int32Value : 0
        self.approvedBy = ((draftDictionary["approved_by"]) != JSON.null) ?  draftDictionary["approved_by"].int32Value : 0
        self.createdBy =  ((draftDictionary["created_by"]) != JSON.null) ?  draftDictionary["created_by"].stringValue : "NA"
        self.updatedBy =  ((draftDictionary["updated_by"]) != JSON.null) ?  draftDictionary["updated_by"].stringValue : "NA"
        self.createdAt =  ((draftDictionary["created_at"]) != JSON.null) ?  draftDictionary["created_at"].stringValue : "NA"
        self.updatedAt =  ((draftDictionary["updated_at"]) != JSON.null) ?  draftDictionary["updated_at"].stringValue : "NA"
        self.mandiId = ((draftDictionary["mandi_id"]) != JSON.null) ?  draftDictionary["mandi_id"].int32Value : 0
        self.referenceId = ((draftDictionary["reference_id"]) != JSON.null) ?  draftDictionary["reference_id"].int32Value : 0
        self.orderId = ((draftDictionary["order_id"]) != JSON.null) ?  draftDictionary["order_id"].int32Value : 0
        self.inventoryLocationId = ((draftDictionary["inventory_location_id"]) != JSON.null) ?  draftDictionary["inventory_location_id"].int32Value : 0
        self.active = ((draftDictionary["active"]) != JSON.null) ?  draftDictionary["active"].int32Value : 0
        self.inventoryType =  ((draftDictionary["inventory_type"]) != JSON.null) ?  draftDictionary["inventory_type"].stringValue : "NA"
        self.mandisName =  ((draftDictionary["mandis_name"]) != JSON.null) ?  draftDictionary["mandis_name"].stringValue : "NA"
        self.inventoryManager =  ((draftDictionary["inventory_manager"]) != JSON.null) ?  draftDictionary["inventory_manager"].stringValue : "NA"
        self.inventoryAddress =  ((draftDictionary["inventory_address"]) != JSON.null) ?  draftDictionary["inventory_address"].stringValue : "NA"
        self.arthiyaName =  ((draftDictionary["arthiya_name"]) != JSON.null) ?  draftDictionary["arthiya_name"].stringValue : "NA"
    }
}
