//
//  AboutPlaceContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewAboutPlaceProtocol {
   
    func showImages(_ images: [UIImage?])
    func showObject(_ object: Object)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAboutPlaceProtocol {
    
    var view: PresenterToViewAboutPlaceProtocol? { get set }
    var interactor: PresenterToInteractorAboutPlaceProtocol? { get set }
    var router: PresenterToRouterAboutPlaceProtocol? { get set }
    
    func viewDidLoadObject()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAboutPlaceProtocol {
    
    var presenter: InteractorToPresenterAboutPlaceProtocol? { get set }
    var object: Objects? { get set }
    var mapKitService: MapKitServiceProtocol? { get set }
    
    func setImages() -> [UIImage?]
    func setObject() -> Object
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAboutPlaceProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAboutPlaceProtocol {
    
}
