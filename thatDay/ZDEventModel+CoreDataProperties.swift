//
//  ZDEventModel+CoreDataProperties.swift
//  
//
//  Created by dongmei zeng on 16/6/9.
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
    @NSManaged var leancloudId: String?

}
