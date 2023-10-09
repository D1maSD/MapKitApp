//
//  CurrentNewsPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation

final class CurrentNewsPresenter: ViewToPresenterCurrentNewsProtocol {

    // MARK: Properties
    var view: PresenterToViewCurrentNewsProtocol?
    var interactor: PresenterToInteractorCurrentNewsProtocol?
    var router: PresenterToRouterCurrentNewsProtocol?
    
    func viewDidLoadDetail() {
        if let newsItem = interactor?.newsItem {
            view?.showNote(newsItem)
        }
    }
}

extension CurrentNewsPresenter: InteractorToPresenterCurrentNewsProtocol {
    
}
