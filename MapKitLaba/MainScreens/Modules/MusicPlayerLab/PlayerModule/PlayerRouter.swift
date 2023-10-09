//
//  PlayerRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

final class PlayerRouter: PresenterToRouterPlayerProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = PlayerViewController()
        
        let presenter: ViewToPresenterPlayerProtocol & InteractorToPresenterPlayerProtocol = PlayerPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PlayerRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PlayerInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
    static func presentPlayerScreen(with songs: [Song], at indexPath: IndexPath) -> UIViewController {
        
        let viewController = PlayerViewController()
        
        let presenter: ViewToPresenterPlayerProtocol & InteractorToPresenterPlayerProtocol = PlayerPresenter()
        
        let musicService: MusicSecviceProtocol = SongService()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PlayerRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PlayerInteractor()
        viewController.presenter?.interactor?.songs = songs
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.musicService = musicService
        viewController.presenter?.interactor?.indexPath = indexPath
        
        return viewController
    }
}
