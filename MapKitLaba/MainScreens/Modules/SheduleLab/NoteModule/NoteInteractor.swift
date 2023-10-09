//
//  NoteInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import Foundation

final class NoteInteractor: PresenterToInteractorNoteProtocol {
    
    
    var dataManager: NoteDataManagerProtocol?
    var userDataManager: UsersDataManagerProtocol? 
    var noteItem: Note?
    var indexPath: IndexPath?
    var savedPersonShared = SavedNote.shared
    var selectedItem: UserProfile? {
        
        let item = savedPersonShared.selectedPerson
        if item != nil {

        } else {
        }
        return item
    }
    
    func deleteNote(item: Note) {
        dataManager?.deleteNote(item: item)
    }
    
    func updateNote(item: Note, title: String, note: String, indexPath: IndexPath) {
        if selectedItem?.name != nil {

        } else {
        }
        dataManager?.updateItemWithSelectedContact(item: item, title: note, note: note, indexPath: indexPath, selectedItem: selectedItem ?? UserProfile())
    }
    

    // MARK: Properties
    var presenter: InteractorToPresenterNoteProtocol?
    
    func createNote(item: Note, title: String, note: String, date: Date) {
        
        if selectedItem != nil {
            
                  

        } else {
        }
        
        
        if indexPath != nil && selectedItem != nil {
            
            dataManager?.updateItemWithSelectedContact(item: noteItem ?? Note(), title: title, note: note, indexPath: indexPath ?? IndexPath(), selectedItem: selectedItem ?? UserProfile()) //MARK: FIX ME
            
        } else if indexPath != nil {
            
            dataManager?.updateItemWithNoContact(item: noteItem ?? Note(), title: title, note: note, indexPath: indexPath ?? IndexPath(), selectedItem: selectedItem ?? UserProfile())
            
        } else {
            //FIXME: HERE IF WE NAVE A NIL indexPath but selectedItem != nil we pass
            dataManager?.createNote(title: title, note: note, date: date, selectedItem: selectedItem ?? UserProfile()) //MARK: FIX ME
        }
        
    }
}
