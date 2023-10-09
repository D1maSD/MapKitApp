//
//  MainScreenRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.11.2022.
//  
//

import Foundation
import UIKit

final class MainScreenRouter: PresenterToRouterMainScreenProtocol {
    
    func presentFlow(view: UIViewController, flow: Flow) {
        switch flow {
        case .mapKitFlow:
            view.navigationController?.pushViewController(
                MapKitRouter.createModule(),
                animated: true
            )
        case .playerFlow:
            view.navigationController?.pushViewController(
                PlaylistRouter.createModule(),
                animated: true
            )
        case .sheduleKitFlow:
            view.navigationController?.pushViewController(
                SheduleLabRouter.createModule(),
                animated: true
            )
        case .newsFlow:
            view.navigationController?.pushViewController(
                ListNewsLabRouter.createModule(),
                animated: true
            )
        case .booksFlow: 
            view.navigationController?.pushViewController(
                BooksRouter.createModule(),
                animated: true
            )
        }
        
    }
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = MainScreenViewController()
        
        let presenter: ViewToPresenterMainScreenProtocol & InteractorToPresenterMainScreenProtocol = MainScreenPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MainScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MainScreenInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
