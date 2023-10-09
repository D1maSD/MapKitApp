//
//  SheduleLabRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation
import UIKit

final class SheduleLabRouter: PresenterToRouterSheduleLabProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = SheduleLabViewController()
        
        let presenter: ViewToPresenterSheduleLabProtocol & InteractorToPresenterSheduleLabProtocol = SheduleLabPresenter()
        let dataManager: NoteDataManagerProtocol = NoteDataManager()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SheduleLabRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SheduleLabInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.dataManager = dataManager
        
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
    
    func popToContactsScreen(self: UIViewController) {

        self.navigationController?.pushViewController(
            ContactsRouter.createModule(),
            animated: true
        )
    }
    
    func presentNoteDetailScreen(from view: PresenterToViewSheduleLabProtocol, _ note: Note, with indexPath: IndexPath) {
        
        let viewController = NoteRouter.presentNoteDetailScreen(note, with: indexPath)
        guard let view = view as? UIViewController else {
            return
        }
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
