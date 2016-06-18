//
//  ZDEventModel+CoreDataProperties.swift
//  
//
//  Created by zz on 16/5/20.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ZDEventModel {

    @NSManaged var event: String?
    @NSManaged var lasting: String?
    @NSManaged var remind: String?
    @NSManaged var time: NSDate?

}
