//
//  CurrentNewsContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewCurrentNewsProtocol {
    func showNote(_ note: NewsItem)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCurrentNewsProtocol {
    
    var view: PresenterToViewCurrentNewsProtocol? { get set }
    var interactor: PresenterToInteractorCurrentNewsProtocol? { get set }
    var router: PresenterToRouterCurrentNewsProtocol? { get set }
    
    func viewDidLoadDetail()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCurrentNewsProtocol {
    
    var presenter: InteractorToPresenterCurrentNewsProtocol? { get set }
    var newsService: NewsSecviceProtocol? { get set }
    var newsItem: NewsItem? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCurrentNewsProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCurrentNewsProtocol {
    
}
