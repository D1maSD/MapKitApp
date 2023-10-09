//
//  AboutPlacePresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

final class AboutPlacePresenter: ViewToPresenterAboutPlaceProtocol {

    // MARK: Properties
    var view: PresenterToViewAboutPlaceProtocol?
    var interactor: PresenterToInteractorAboutPlaceProtocol?
    var router: PresenterToRouterAboutPlaceProtocol?
    
    func viewDidLoadObject() {
        if let images = interactor?.setImages() {
            view?.showImages(images)
        }
        
        if let object = interactor?.setObject() {
            view?.showObject(object)
        }
    }
}

extension AboutPlacePresenter: InteractorToPresenterAboutPlaceProtocol {
    
}
