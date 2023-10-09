//
//  PlaylistPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

final class PlaylistPresenter: ViewToPresenterPlaylistProtocol {
    func viewDidLoad() {
        if let song = interactor?.fetchFrom() {
            print(song.count)
            view?.setSongs(model: song)
        }
    }
    
    func viewWillAppear() {
        viewDidLoad()
    }
    
    func deleteTapped(at indexPath: IndexPath) {
        interactor?.deleteTapped(at: indexPath)
    }
    
    func showPlayer(with songs: [Song], at indexPath: IndexPath) {
        guard let view = view else {
            return
        }
        router?.presentPlayerScreen(from: view, with: songs, at: indexPath)
        
    }
    
    // MARK: Properties
    var view: PresenterToViewPlaylistProtocol?
    var interactor: PresenterToInteractorPlaylistProtocol?
    var router: PresenterToRouterPlaylistProtocol?
}

extension PlaylistPresenter: InteractorToPresenterPlaylistProtocol {
    func didRetrieveSongs(_ notes: [Song]) {
        
    }
}
