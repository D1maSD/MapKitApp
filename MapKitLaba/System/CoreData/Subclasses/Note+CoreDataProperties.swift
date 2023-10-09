//
//  Note+CoreDataProperties.swift
//  
//
//  Created by Мельник Дмитрий on 18.07.2023.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var email: String?
    @NSManaged public var markedAsDone: Bool
    @NSManaged public var note: String?
    @NSManaged public var personImage: Data?
    @NSManaged public var personName: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var statusOrCompany: String?
    @NSManaged public var title: String?

}
