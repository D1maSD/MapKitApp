//
//  NewsLabInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation

final class ListNewsLabInteractor: PresenterToInteractorNewsLabProtocol {
    
    var newsService: NewsSecviceProtocol?
    
    private var notes: [NewsItem] {
        return newsService?.fetchNews() ?? [NewsItem]()
    }
    

    // MARK: Properties
    var presenter: InteractorToPresenterNewsLabProtocol?

    func fetchNews() -> [NewsItem]? {
        let news = newsService?.fetchNews()
        return news
    }
}
