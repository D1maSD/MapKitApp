//
//  NoteRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import Foundation
import UIKit

final class NoteRouter: PresenterToRouterNoteProtocol {
    
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
    
    func popVC(root: UIViewController, view: UIViewController) {
        
        view.navigationController?.popViewController(animated: true)
    }
    
    var viewController: UIViewController?
    
    
    
    
    var delegate: PresenterToViewContactsProtocol?
    func load(on view: UIViewController) {
        if let vcNote = view as? ContactsViewController {
            delegate = vcNote
        }
    }
    
    var rootViewController: UIViewController?
    
    func presentContactsScreen() {

    }
    
    func openPopover(controller: UIViewController, on view: UIViewController) {
        self.viewController = UIViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        view.navigationController?.modalPresentationStyle = UIModalPresentationStyle.popover
        view.navigationController?.present(navigationController, animated: true, completion: {
        })
    }
    
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = NoteViewController()
        
        let presenter: ViewToPresenterNoteProtocol & InteractorToPresenterNoteProtocol = NotePresenter()
        let dataManager: NoteDataManagerProtocol = NoteDataManager()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NoteRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NoteInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.dataManager = dataManager
        
        return viewController
    }
    
    static func presentNoteDetailScreen(_ note: Note, with indexPath: IndexPath) -> UIViewController {
        
        let viewController = NoteViewController()
        
        let presenter: ViewToPresenterNoteProtocol & InteractorToPresenterNoteProtocol = NotePresenter()
        let dataManager: NoteDataManagerProtocol = NoteDataManager()
        let userDataManager: UsersDataManagerProtocol? = UserDataManager()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NoteRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NoteInteractor()
        viewController.presenter?.interactor?.noteItem = note
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.dataManager = dataManager
        viewController.presenter?.interactor?.userDataManager = userDataManager
        viewController.presenter?.interactor?.indexPath = indexPath
        
        return viewController
    }
}
