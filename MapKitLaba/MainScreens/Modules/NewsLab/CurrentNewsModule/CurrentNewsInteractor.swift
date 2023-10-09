//
//  CurrentNewsInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation

final class CurrentNewsInteractor: PresenterToInteractorCurrentNewsProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterCurrentNewsProtocol?
    var newsService: NewsSecviceProtocol?
    var newsItem: NewsItem? 
}
