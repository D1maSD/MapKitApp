//
//  MapKitRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation
import UIKit

final class MapKitRouter: PresenterToRouterMapKitProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = MapKitViewController()
        
        let presenter: ViewToPresenterMapKitProtocol & InteractorToPresenterMapKitProtocol = MapKitPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MapKitRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MapKitInteractor()
        viewController.presenter?.interactor?.presenter = presenter        
        return viewController
    }
    
    func presentAboutPlaceScreen(from view: PresenterToViewMapKitProtocol, _ object: Objects, with indexPath: IndexPath) {
        
        
        let viewController = AboutPlaceRouter.presentAboutPlaceScreen(object, with: indexPath)
        guard let view = view as? UIViewController else {
            return
        }
        
        print("PRESENTERABOUTSCREEN SheduleLabRouter")
        view.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
