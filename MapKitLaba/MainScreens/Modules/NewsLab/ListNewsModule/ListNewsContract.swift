//
//  NewsLabContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNewsLabProtocol: AnyObject {
    func setNews(news: [NewsItem])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNewsLabProtocol {
    
    var view: PresenterToViewNewsLabProtocol? { get set }
    var interactor: PresenterToInteractorNewsLabProtocol? { get set }
    var router: PresenterToRouterNewsLabProtocol? { get set }
    var news: [NewsItem]? { get set }
    
    func numberOfRowsInSection() -> Int
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
    
    func openSelectedNewsViewController(on view: UIViewController, news: NewsItem)
    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewsLabProtocol {
    
    var presenter: InteractorToPresenterNewsLabProtocol? { get set }
    func fetchNews() -> [NewsItem]? 
    var newsService: NewsSecviceProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewsLabProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNewsLabProtocol {
    func openCurrentNews(on view: UIViewController, news: NewsItem)
}
