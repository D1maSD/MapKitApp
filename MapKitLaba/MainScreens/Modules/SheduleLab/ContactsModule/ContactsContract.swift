//
//  ContactsContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 18.11.2022.
//  
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewContactsProtocol {
    
    //MARK: setModel(model: [UserProfile])
    func setModel(model: [UserProfile])
    func printSomeInfo()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterContactsProtocol {
    
    var view: PresenterToViewContactsProtocol? { get set }
    var interactor: PresenterToInteractorContactsProtocol? { get set }
    var router: PresenterToRouterContactsProtocol? { get set }
    var models: [UserProfile]? { get set }
    func viewDidLoad()
    func addDidTapped()
    func showScreen(from: UIViewController, view: SheduleScreens)
    func viewWillAppear()
    func deleteTapped(item: UserProfile)
    func showProfileDetail(_ item: UserProfile, with indexPath: IndexPath)
    func userDidPicked(_ item: [UserProfile], indexPath: IndexPath)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorContactsProtocol {
    
    var presenter: InteractorToPresenterContactsProtocol? { get set }
    var dataManager: UsersDataManagerProtocol? { get set }
    var noteDataManager: NoteDataManagerProtocol? { get set }
    
    func fetchFrom() -> [UserProfile]?
    func retrieveItems()
    func deleteTapped(item: UserProfile)
    func userDidPicked(_ item: UserProfile, indexPath: IndexPath)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterContactsProtocol {
    func didRetrieveItems(items: [UserProfile])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterContactsProtocol {
    func showScreen(from: UIViewController, view: SheduleScreens)
    func presentProfileDetailScreen(from view: PresenterToViewContactsProtocol, _ item: UserProfile, with indexPath: IndexPath)
}
