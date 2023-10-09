//
//  SheduleLabInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation

final class SheduleLabInteractor: PresenterToInteractorSheduleLabProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterSheduleLabProtocol?
    var dataManager: NoteDataManagerProtocol?
    var notes: [Note] {
        return dataManager?.updateModels() ?? [Note]()
    }
    
    var savedPersonShared = SavedNote.shared
    
//    var selectedItem: UserProfile? {
//        return userDataManager?.selectedPerson
////        return userDataManager?.selectedPerson ?? UserProfile()
//    }
    
    
    
    var selectedItem: UserProfile? {
        
        
        let item = savedPersonShared.selectedPerson
        if item != nil {
        } else {
            print("### selectedItem name == nil SheduleLabInteractor")
        }
        
        return item
    }
        
    func fetchFrom() -> [Note]? {
        
        let note = dataManager?.updateModels()
        return note
    }
    
    func deleteTapped(note: Note) {
        dataManager?.deleteNote(item: note)
    }
    
    func retrieveNotes() {
        presenter?.didRetrieveNotes(notes)
    }
}
