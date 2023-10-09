//
//  NotePresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import UIKit


final class NotePresenter: ViewToPresenterNoteProtocol {

    // MARK: Properties
    var view: PresenterToViewNoteProtocol?
    var interactor: PresenterToInteractorNoteProtocol?
    var router: PresenterToRouterNoteProtocol?
    
    var passDataCompletion: ((String, String, Date) -> ())?
    
    func createNote(title: String, note: String, date: Date) {
        //FIXME: here we create note with no userItem
        interactor?.createNote(item: Note(), title: title, note: note, date: date)
    }
    
    func showScreen(from: UIViewController, view: SheduleScreens) {
        router?.showScreen(from: from, view: view)
    }
    
    func viewWillAppearDetail() {
        if let selectedUser = interactor?.selectedItem {
            //MARK: HERE WE PASS NAME OF USER TO VIEWCONTROLLER
           
        } else {
        }
    }
    
    func viewDidLoadDetail() {
        if let noteItem = interactor?.noteItem {
            //MARK: HERE WE PASS TWO DIFFERENT ENTITIES TO VIEW
            let userItem = interactor?.savedPersonShared.selectedPerson
            view?.showNote(noteItem, userItem ?? UserProfile())
        } else {
        }
    }
    
    func popVC(root: UIViewController, view: UIViewController) {
        router?.popVC(root: root, view: view)
    }
     
    func presentContactsScreen() {
    }
}

extension NotePresenter: InteractorToPresenterNoteProtocol {
    
}
