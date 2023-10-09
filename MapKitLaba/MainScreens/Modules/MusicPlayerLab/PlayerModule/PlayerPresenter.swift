//
//  PlayerPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

final class PlayerPresenter: ViewToPresenterPlayerProtocol {
    
    func viewDidLoad() {
        view?.setSongs(fetchSongs(), index: fetchIndex())
    }
    
    // MARK: Properties
    var view: PresenterToViewPlayerProtocol?
    var interactor: PresenterToInteractorPlayerProtocol?
    var router: PresenterToRouterPlayerProtocol?
    
    
    func fetchSongs() -> [Song] {
        let songs = interactor?.fetchSongs()
        guard let songs = songs else {
            return [Song]()
        }
        return songs
    }
    
    func fetchIndex() -> Int {
        let index = interactor?.fetchIndex()
        guard let index = index else {
            return Int()
        }
        return index
    }
}

extension PlayerPresenter: InteractorToPresenterPlayerProtocol {
    
}
