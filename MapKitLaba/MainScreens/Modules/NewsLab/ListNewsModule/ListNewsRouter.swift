//
//  NewsLabRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation
import UIKit

final class ListNewsLabRouter: PresenterToRouterNewsLabProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = ListNewsLabViewController()
        
        let presenter: ViewToPresenterNewsLabProtocol & InteractorToPresenterNewsLabProtocol = ListNewsLabPresenter()
        
        let newsService: NewsSecviceProtocol = NewsService()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ListNewsLabRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ListNewsLabInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.newsService = newsService
        
        return viewController
    }
    
    func openCurrentNews(on view: UIViewController, news: NewsItem) {
        
        let viewController = CurrentNewsRouter.presentCurrentNewsScreen(news)
        
        view.navigationController?.pushViewController(viewController, animated: true)
    }
}
