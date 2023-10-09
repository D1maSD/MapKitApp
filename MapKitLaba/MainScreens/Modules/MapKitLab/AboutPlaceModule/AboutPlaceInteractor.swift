//
//  AboutPlaceInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

final class AboutPlaceInteractor: PresenterToInteractorAboutPlaceProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterAboutPlaceProtocol?
    var object: Objects?
    var mapKitService: MapKitServiceProtocol?
    
    func setImages() -> [UIImage?] {
        if let object = object {
            if let image = mapKitService?.getImages(object: object) {
                return image
            } else {
                return [UIImage?]()
            }
        }
        return [UIImage?]()
    }
    
    func setObject() -> Object {
        if let object = object {
            
            if let object = mapKitService?.getObjects(object: object) {
                return object
            } else {
                return Object(name: "", description: "", mark: "", workTime: "", phone: "", site: "", latitude: "", longitude: "", street: "")
            }
        }
        return Object(name: "", description: "", mark: "", workTime: "", phone: "", site: "", latitude: "", longitude: "", street: "")
    }
}
