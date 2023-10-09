//
//  UserEntitiy+CoreDataProperties.swift
//  
//
//  Created by Мельник Дмитрий on 18.07.2023.
//
//

import Foundation
import CoreData


extension UserEntitiy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntitiy> {
        return NSFetchRequest<UserEntitiy>(entityName: "UserEntitiy")
    }

    @NSManaged public var age: Int64
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var password: String?

}
