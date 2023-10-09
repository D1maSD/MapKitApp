//
//  PlaylistRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

final class PlaylistRouter: PresenterToRouterPlaylistProtocol {
    
    func presentPlayerScreen(from view: PresenterToViewPlaylistProtocol, with songs: [Song], at indexPath: IndexPath) {
        
        let viewController = PlayerRouter.presentPlayerScreen(with: songs, at: indexPath)
        guard let view = view as? UIViewController else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        view.navigationController?.modalPresentationStyle = UIModalPresentationStyle.popover
        view.navigationController?.present(navigationController, animated: true, completion: {
        })
    }
    
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = PlaylistViewController()
        
        let presenter: ViewToPresenterPlaylistProtocol & InteractorToPresenterPlaylistProtocol = PlaylistPresenter()
        let musicService: MusicSecviceProtocol = SongService()
        
        viewController.presenter = presenter
        viewController.presenter?.router = PlaylistRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = PlaylistInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.musicService = musicService
        
        return viewController
    } 
}
