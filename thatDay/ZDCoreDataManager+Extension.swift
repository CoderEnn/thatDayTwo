//
//  ZDCoreDataManager+Extension.swift
//  thatDay
//
//  Created by zz on 16/5/11.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit
import CoreData

extension ZDCoreDataManager {

    func fetchData(entity: String){
        let fetchRequest: NSFetchRequest = NSFetchRequest(entityName: entity)
        
        let sort = NSSortDescriptor(key: "event", ascending: true)
        
        fetchRequest.sortDescriptors = [sort]
        let fetchRequestController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: ZDCoreDataManager.sharedCoreDataManager.managedObjectContext, sectionNameKeyPath: "event", cacheName: nil)
    
        do  {
            try  fetchRequestController.performFetch()
        } catch {
        
        }
    }
    

}