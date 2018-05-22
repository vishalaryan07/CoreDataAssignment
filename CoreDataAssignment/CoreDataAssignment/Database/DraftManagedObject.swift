//
//  ManagedObject.swift
//  CoreDataAssignment
//
//  Created by Vishal Ranjan on 21/05/18.
//  Copyright © 2018 Vishal Ranjan. All rights reserved.
//

import UIKit
import MagicalRecord

class DraftManagedObject: NSObject {
    static let sharedInstance = DraftManagedObject()
    fileprivate override init() {}
    
    func getManagedObject() -> NSManagedObjectContext {
        return NSManagedObjectContext.mr_default()
    }
    
    func saveContext() -> Void {
        self.getManagedObject().mr_saveToPersistentStoreAndWait()
    }
    
    func deleteAllDrafts() -> Void {
        let drafts : [DraftOrder] = DraftOrder.mr_findAll(in: NSManagedObjectContext.mr_default()) as! [DraftOrder]
        for tmpDrafts in drafts {
            tmpDrafts.mr_delete(in: NSManagedObjectContext.mr_default())
        }
        self.saveContext()
    }
    
    func fetchAllDrafts() -> [DraftOrder] {
        let drafts : [DraftOrder] = DraftOrder.mr_findAll(in: NSManagedObjectContext.mr_default()) as! [DraftOrder]
        return drafts
    }

}
