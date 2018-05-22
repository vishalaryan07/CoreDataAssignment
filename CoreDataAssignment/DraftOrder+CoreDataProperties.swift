//
//  DraftOrder+CoreDataProperties.swift
//  
//
//  Created by Vishal Ranjan on 21/05/18.
//
//

import Foundation
import CoreData


extension DraftOrder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DraftOrder> {
        return NSFetchRequest<DraftOrder>(entityName: "DraftOrder")
    }

    @NSManaged public var active: Int32
    @NSManaged public var approvedBy: Int32
    @NSManaged public var arthiyaName: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var createdBy: String?
    @NSManaged public var dataId: Int32
    @NSManaged public var inventoryAddress: String?
    @NSManaged public var inventoryLocationId: Int32
    @NSManaged public var inventoryManager: String?
    @NSManaged public var inventoryType: String?
    @NSManaged public var mandiId: Int32
    @NSManaged public var mandisName: String?
    @NSManaged public var orderDate: String?
    @NSManaged public var orderForPrice: Double
    @NSManaged public var orderForTableId: Int32
    @NSManaged public var orderId: Int32
    @NSManaged public var orderPrice: Double
    @NSManaged public var orderQuantity: Int32
    @NSManaged public var orderStatus: Int32
    @NSManaged public var orderTotalPrice: Double
    @NSManaged public var referenceId: Int32
    @NSManaged public var updatedAt: String?
    @NSManaged public var updatedBy: String?

}
