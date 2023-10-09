//
//  ContactsRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 18.11.2022.
//  
//

import Foundation
import UIKit

final class ContactsRouter: PresenterToRouterContactsProtocol {

    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ContactsViewController()
        
        let presenter: ViewToPresenterContactsProtocol & InteractorToPresenterContactsProtocol = ContactsPresenter()
        let dataManager: UsersDataManagerProtocol = UserDataManager()
        
        let noteDataManager: NoteDataManagerProtocol = NoteDataManager()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ContactsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ContactsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.dataManager = dataManager
        viewController.presenter?.interactor?.noteDataManager = noteDataManager
        
        return viewController
    }
    
    func showScreen(from: UIViewController, view: SheduleScreens) {
        switch view {
        case .note:
            from.navigationController?.pushViewController(
                NoteRouter.createModule(),
                animated: true
            )
        case .contacts:
            from.navigationController?.pushViewController(
                ContactsRouter.createModule(),
                animated: true
            )
        case .profile:
            from.navigationController?.pushViewController(
                ProfileScreenRouter.createModule(),
                animated: true
            )
        case .shedule:
            from.navigationController?.pushViewController(
                SheduleLabRouter.createModule(),
                animated: true
            )
        }
    }
    
    func presentProfileDetailScreen(from view: PresenterToViewContactsProtocol, _ item: UserProfile, with indexPath: IndexPath) {
        
        let viewController = ProfileScreenRouter.presentProfileDetailScreen(item, with: indexPath)
        
        guard let view = view as? UIViewController else {
            return
        }
        
        view.navigationController?.pushViewController(
            viewController,
            animated: true
        )
    }
}
