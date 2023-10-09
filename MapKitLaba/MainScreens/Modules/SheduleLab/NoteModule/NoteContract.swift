//
//  NoteContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNoteProtocol {
    func showNote(_ note: Note, _ userProfile: UserProfile)
    func showPerson(_ userProfile: UserProfile)
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNoteProtocol {
    
    var view: PresenterToViewNoteProtocol? { get set }
    var interactor: PresenterToInteractorNoteProtocol? { get set }
    var router: PresenterToRouterNoteProtocol? { get set }
    
    var passDataCompletion: ((String, String, Date) -> ())? { get set }
    
    func createNote(title: String, note: String, date: Date)
    func showScreen(from: UIViewController, view: SheduleScreens)
    func popVC(root: UIViewController, view: UIViewController)
    func presentContactsScreen()
    func viewDidLoadDetail()
    func viewWillAppearDetail()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNoteProtocol {
    
    var presenter: InteractorToPresenterNoteProtocol? { get set }
    var dataManager: NoteDataManagerProtocol? { get set }
    var noteItem: Note? { get set }
    var userDataManager: UsersDataManagerProtocol? { get set }
    var indexPath: IndexPath? { get set }
    var selectedItem: UserProfile? { get }
    var savedPersonShared: SavedNote { get }
    
    func createNote(item: Note, title: String, note: String, date: Date)
    
    func deleteNote(item: Note)

    func updateNote(
        item: Note,
        title: String,
        note: String,
        indexPath: IndexPath
    )
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNoteProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNoteProtocol {

    func showScreen(from: UIViewController, view: SheduleScreens)
    
    var viewController: UIViewController? { get set }
    
    func popVC(root: UIViewController, view: UIViewController)
    
    static func presentNoteDetailScreen(_ note: Note, with indexPath: IndexPath) -> UIViewController
        
}
