//
//  UserProfile+CoreDataProperties.swift
//  
//
//  Created by Мельник Дмитрий on 18.07.2023.
//
//

import Foundation
import CoreData


extension UserProfile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserProfile> {
        return NSFetchRequest<UserProfile>(entityName: "UserProfile")
    }

    @NSManaged public var age: String?
    @NSManaged public var date: String?
    @NSManaged public var gender: String?
    @NSManaged public var instagram: String?
    @NSManaged public var name: String?
    @NSManaged public var nameOfWork: String?
    @NSManaged public var personImage: Data?

}
