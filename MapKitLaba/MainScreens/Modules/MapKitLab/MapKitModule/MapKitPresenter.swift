//
//  MapKitPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation

final class MapKitPresenter: ViewToPresenterMapKitProtocol {

    // MARK: Properties
    var view: PresenterToViewMapKitProtocol?
    var interactor: PresenterToInteractorMapKitProtocol?
    var router: PresenterToRouterMapKitProtocol?
    
    func presentAboutPlaceScreen(_ object: Objects, with places: IndexPath) {
        print("PRESENTERABOUTSCREEN MapKitPresenter")
        guard let view = view else {
            return }
        router?.presentAboutPlaceScreen(from: view, object, with: IndexPath())
    }
    
}

extension MapKitPresenter: InteractorToPresenterMapKitProtocol {
    
}
