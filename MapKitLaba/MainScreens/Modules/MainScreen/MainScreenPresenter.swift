//
//  MainScreenPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.11.2022.
//  
//

import UIKit


final class MainScreenPresenter: ViewToPresenterMainScreenProtocol {
    
    
    func numberOfRowsInSection() -> Int {
        guard let newsNubers = self.cellCount else {
            return 0
        }
        return newsNubers
    }
    
    func didSelectRowAt(index: Int) {
    }
    
    func deselectRowAt(index: Int) {
    }
    
    func presentFlow(view: UIViewController, flow: Flow) {
//        flow == Flow.booksFlow ? router?.presentFlow(view: view, flow: flow) : print("booksFlow")
        router?.presentFlow(view: view, flow: flow)
    }

    // MARK: Properties
    var view: PresenterToViewMainScreenProtocol?
    var interactor: PresenterToInteractorMainScreenProtocol?
    var router: PresenterToRouterMainScreenProtocol?
    var cellCount: Int? = 4
}

extension MainScreenPresenter: InteractorToPresenterMainScreenProtocol {
    
}
