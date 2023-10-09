//
//  PlayerContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewPlayerProtocol {
    func setSongs(_ songs: [Song], index: Int)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterPlayerProtocol {
    
    var view: PresenterToViewPlayerProtocol? { get set }
    var interactor: PresenterToInteractorPlayerProtocol? { get set }
    var router: PresenterToRouterPlayerProtocol? { get set }
    
    func viewDidLoad()
    func fetchSongs() -> [Song]
    func fetchIndex() -> Int
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorPlayerProtocol {
    
    var presenter: InteractorToPresenterPlayerProtocol? { get set }
    var songs: [Song] { get set }
    var musicService: MusicSecviceProtocol? { get set }
    func fetchSongs() -> [Song]
    func fetchIndex() -> Int
    var indexPath: IndexPath? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterPlayerProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPlayerProtocol {
    
}
