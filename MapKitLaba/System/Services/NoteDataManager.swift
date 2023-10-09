//
//  NoteDataManager.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 12.12.2022.
//

import CoreData
import UIKit


final class NoteDataManager: NoteDataManagerProtocol {
    
//    func updateItem(
//        item: Note,
//        title: String,
//        note: String,
//        indexPath: IndexPath
//    ) {
//        <#code#>
//    }
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var models = [Note]()
    
    var userDataManager: UsersDataManagerProtocol?
    var savedPersonShared = SavedNote.shared
    
    func updateModels() -> [Note] {
        
        do {
            models = try context.fetch(Note.fetchRequest())
            return models
            
        } catch {
            return [Note]()
        }
    }
    
    func getAllNotes() {
        
        do {
            models = try context.fetch(Note.fetchRequest())
                        
        } catch {
            print("error to getAllItems")
        }
    }
    
    func createNote(
        title: String,
        note: String,
        date: Date,
        selectedItem: UserProfile?
    ) {
        let newItem = Note(context: context)
        newItem.title = title
        newItem.note = note
        newItem.createdAt = date
        
        if let selectedItem = savedPersonShared.selectedPerson {
            newItem.personImage = selectedItem.personImage
        } else {
        }
        
        do {
            try context.save()
            getAllNotes()
        } catch {
            
        }
    }
    
    func deleteNote(item: Note) {
        context.delete(item)
        
        do {
            try context.save()
            getAllNotes()
        } catch {
            
        }
    }
    
    func updateItemWithSelectedContact(
        item: Note,
        title: String,
        note: String,
        indexPath: IndexPath,
        selectedItem: UserProfile
    ) {
        
        do {
            models = try context.fetch(Note.fetchRequest())
            
        } catch {
            print("error to getAllItems")
        }
        
        item.title = title
        item.note = note
        item.personImage = selectedItem.personImage
        item.personName = selectedItem.name
        item.statusOrCompany = selectedItem.nameOfWork
        self.models.insert(item, at: indexPath.row)
        
        do {
            try context.save()
        } catch {
            print("Notes was not saved")
        }
    }
    
    func updateItemWithNoContact(
        item: Note,
        title: String,
        note: String,
        indexPath: IndexPath,
        selectedItem: UserProfile
    ) {
        
        do {
            models = try context.fetch(Note.fetchRequest())
            
        } catch {
            print("error to getAllItems")
        }
        
        item.title = title
        item.note = note
        
        self.models.insert(item, at: indexPath.row)
        
        do {
            try context.save()
        } catch {
            print("Notes was not saved")
        }
    }
}


