//
//  PlaylistInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

final class PlaylistInteractor: PresenterToInteractorPlaylistProtocol {
    
    // MARK: Properties
    var presenter: InteractorToPresenterPlaylistProtocol?
    var musicService: MusicSecviceProtocol?
    
    func fetchFrom() -> [Song]? {
        musicService?.fetchSongs()
    }
    
    func deleteTapped(at indexPath: IndexPath) {
        musicService?.deleteSong(at: indexPath)
    }
    
    func retrieveSongs() {
        
    }
}
