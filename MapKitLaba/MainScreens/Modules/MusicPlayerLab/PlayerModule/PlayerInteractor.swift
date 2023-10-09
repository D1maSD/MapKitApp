//
//  PlayerInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

final class PlayerInteractor: PresenterToInteractorPlayerProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterPlayerProtocol?
    var songs: [Song] = []
    var musicService: MusicSecviceProtocol?
    var indexPath: IndexPath?
    
    func fetchSongs() -> [Song] {
        return songs
    }
    
    func fetchIndex() -> Int {
        guard let indexPath = indexPath else {
            return Int()
        }
        return indexPath.row
    }
}
