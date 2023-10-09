//
//  CurrentNewsRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation
import UIKit

final class CurrentNewsRouter: PresenterToRouterCurrentNewsProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = CurrentNewsViewController()
        
        let presenter: ViewToPresenterCurrentNewsProtocol & InteractorToPresenterCurrentNewsProtocol = CurrentNewsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CurrentNewsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CurrentNewsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    static func presentCurrentNewsScreen(_ news: NewsItem) -> UIViewController {
        
        let viewController = CurrentNewsViewController()
        
        let presenter: ViewToPresenterCurrentNewsProtocol & InteractorToPresenterCurrentNewsProtocol = CurrentNewsPresenter()
        
        let newsService: NewsSecviceProtocol = NewsService()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CurrentNewsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CurrentNewsInteractor()
        viewController.presenter?.interactor?.newsItem = news
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.newsService = newsService
        
        return viewController
    }
    
    
    
}
