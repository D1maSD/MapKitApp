//
//  BooksRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 27.03.2023.
//

import UIKit


class BooksRouter {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = BooksViewController()
        
        let viewModel: BooksVeiwModelProtocol = BooksViewModel()
//        let dataManager: NoteDataManagerProtocol = NoteDataManager()
        
        viewController.viewModel = viewModel
        viewController.viewModel?.router = BooksRouter()
        viewController.viewModel?.view = viewController
//        viewController.presenter?.interactor = NoteInteractor()
//        viewController.presenter?.interactor?.presenter = presenter
//        viewController.presenter?.interactor?.dataManager = dataManager
        
        return viewController
    }
}
