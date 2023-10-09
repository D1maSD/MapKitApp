//
//  ContactsInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 18.11.2022.
//  
//

import Foundation

final class ContactsInteractor: PresenterToInteractorContactsProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterContactsProtocol?
    
    var savedPerson = SavedNote.shared
    
    var items: [UserProfile] {
        return dataManager?.updateModels() ?? [UserProfile]()
    }
    
    var dataManager: UsersDataManagerProtocol?
    var noteDataManager: NoteDataManagerProtocol?
    
    func fetchFrom() -> [UserProfile]? {
        
        let state = dataManager?.updateModels()
        return state
    }
    
    func deleteTapped(item: UserProfile) {
        dataManager?.deleteItem(item: item)
    }
    
    func retrieveItems() {
        presenter?.didRetrieveItems(items: items)
    }
    
    func userDidPicked(_ item: UserProfile, indexPath: IndexPath) {
    
        savedPerson.selectedPerson = item
        
    }
}
