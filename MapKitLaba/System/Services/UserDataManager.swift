//
//  NoteDataManager.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 06.12.2022.
//

import CoreData
import UIKit


class UserDataManager: UsersDataManagerProtocol {
    
    init() {
        print("UserDataManager was init() \(savedPersonShared.selectedPerson)")
    }

    public static let shared = UserDataManager()
    
    var savedPersonShared = SavedNote.shared
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var models = [UserProfile]()
    
    func updateSelected() -> UserProfile {
        if let selectedPerson = savedPersonShared.selectedPerson {
            return selectedPerson
        } else {
            return UserProfile()
        }
        
    }
    
    func updateModels() -> [UserProfile] {
        
        do {
            models = try context.fetch(UserProfile.fetchRequest())
            return models
            
        } catch {
            return [UserProfile]()
        }
    }
    
    func getAllItems() {
        
        do {
            models = try context.fetch(UserProfile.fetchRequest())
        } catch {
            print("error to getAllItems")
        }
    }
    
    func createItem(
        name: String,
        date: String,
        gender: String,
        age: String,
        instagram: String,
        nameOfWork: String,
        personImage: Data
    ) {
        let newItem = UserProfile(context: context)
        newItem.name = name
        newItem.date = date
        newItem.gender = gender
        newItem.age = age
        newItem.instagram = instagram
        newItem.nameOfWork = nameOfWork
        newItem.personImage = personImage
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
    
    func deleteItem(item: UserProfile) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        } catch {
            
        }
    }
    
    func updateItem(
        item: UserProfile,
        name: String,
        date: String,
        gender: String,
        age: String,
        instagram: String,
        nameOfWork: String,
        personImage: Data,
        indexPath: IndexPath
    ) {
        
        do {
            models = try context.fetch(UserProfile.fetchRequest())
            
        } catch {
            print("error to getAllItems")
        }
        
        item.name = name
        item.date = date
        item.gender = gender
        item.age = age
        item.instagram = instagram
        item.nameOfWork = nameOfWork
        item.personImage = personImage
        
        self.models.insert(item, at: indexPath.row)
        
        do {
            try context.save()
        } catch {
            print("Notes was not saved")
        }
    }
}




class SavedNote {
    
    public static let shared = SavedNote()
    
    var selectedPerson: UserProfile? {
        didSet {
        }
    }
}
