//
//  ProfileScreenRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

final class ProfileScreenRouter: PresenterToRouterProfileScreenProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ProfileScreenViewController()
        
        let presenter: ViewToPresenterProfileScreenProtocol & InteractorToPresenterProfileScreenProtocol = ProfileScreenPresenter()
        let dataManager: UsersDataManagerProtocol = UserDataManager()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ProfileScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ProfileScreenInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.dataManager = dataManager
        
        return viewController
    }
    
    static func presentProfileDetailScreen(_ item: UserProfile, with indexPath: IndexPath) -> UIViewController {
        
        let viewController = ProfileScreenViewController()
        
        let presenter: ViewToPresenterProfileScreenProtocol & InteractorToPresenterProfileScreenProtocol = ProfileScreenPresenter()
        let dataManager: UsersDataManagerProtocol = UserDataManager()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ProfileScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ProfileScreenInteractor()
        viewController.presenter?.interactor?.userItem = item
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.dataManager = dataManager
        viewController.presenter?.interactor?.indexPath = indexPath
        
        return viewController
    }
    
}
