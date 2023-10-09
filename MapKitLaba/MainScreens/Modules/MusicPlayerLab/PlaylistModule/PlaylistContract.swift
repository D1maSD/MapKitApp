//
//  PlaylistContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewPlaylistProtocol {
    func setSongs(model: [Song])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPlaylistProtocol {
    
    var view: PresenterToViewPlaylistProtocol? { get set }
    var interactor: PresenterToInteractorPlaylistProtocol? { get set }
    var router: PresenterToRouterPlaylistProtocol? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func deleteTapped(at indexPath: IndexPath)
    func showPlayer(with songs: [Song], at indexPath: IndexPath)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPlaylistProtocol {
    
    var presenter: InteractorToPresenterPlaylistProtocol? { get set }
    
    var musicService: MusicSecviceProtocol? { get set }
    
    func fetchFrom() -> [Song]?
    
    func deleteTapped(at indexPath: IndexPath)
    func retrieveSongs()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPlaylistProtocol {
    func didRetrieveSongs(_ notes: [Song])
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPlaylistProtocol {
    func presentPlayerScreen(from view: PresenterToViewPlaylistProtocol, with songs: [Song], at indexPath: IndexPath)
}
