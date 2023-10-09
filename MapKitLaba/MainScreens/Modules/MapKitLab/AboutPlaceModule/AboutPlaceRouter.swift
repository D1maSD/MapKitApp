//
//  AboutPlaceRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

final class AboutPlaceRouter: PresenterToRouterAboutPlaceProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = AboutPlaceViewController()
        
        let presenter: ViewToPresenterAboutPlaceProtocol & InteractorToPresenterAboutPlaceProtocol = AboutPlacePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AboutPlaceRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AboutPlaceInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    static func presentAboutPlaceScreen(_ object: Objects, with indexPath: IndexPath) -> UIViewController {
        
        let viewController = AboutPlaceViewController()
        
        let presenter: ViewToPresenterAboutPlaceProtocol & InteractorToPresenterAboutPlaceProtocol = AboutPlacePresenter()
        
        let mapKitService: MapKitServiceProtocol = MapKitService()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AboutPlaceRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AboutPlaceInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.object = object
        viewController.presenter?.interactor?.mapKitService = mapKitService
        
        return viewController
    }
}
