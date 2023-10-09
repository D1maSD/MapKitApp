//
//  MusicStruct.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 25.12.2022.
//

import Foundation


struct Song {
    let name: String
    let albumName: String
    let imageName: String
    let artistName: String
    let trackName: String
}

protocol MusicSecviceProtocol {
    
    var songItems: [Song] { get set }
    func fetchSongs() -> [Song]
    func deleteSong(at indexPath: IndexPath)
}


class SongService: MusicSecviceProtocol {
    
    var songItems: [Song] = [
        Song(name: "Havana",
             albumName: "123 Other",
             imageName: "cover3",
             artistName: "Camilla Cabello",
             trackName: "Havana"),
        Song(name: "Background music",
             albumName: "Havana album",
             imageName: "cover1",
             artistName: "Rnado",
             trackName: "Backgroundmusic"),
        Song(name: "Viva La Vida",
             albumName: "123 Something",
             imageName: "cover2", artistName: "Coldplay",
             trackName: "VivaLaVida")
    ]
    
    func fetchSongs() -> [Song] {
        return songItems
    }
    
    func deleteSong(at indexPath: IndexPath) {
        songItems.remove(at: indexPath.row)
    }
}
