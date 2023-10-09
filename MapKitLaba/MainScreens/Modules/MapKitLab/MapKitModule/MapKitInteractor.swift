//
//  MapKitInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation
import MapKit

final class MapKitInteractor: PresenterToInteractorMapKitProtocol, MapViewArray {
    typealias MapArray = MKAnnotation
    

    // MARK: Properties
    var presenter: InteractorToPresenterMapKitProtocol?
    var places: [MKAnnotation]?
    
}
