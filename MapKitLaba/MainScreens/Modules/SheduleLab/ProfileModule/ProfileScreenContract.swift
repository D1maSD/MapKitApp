//
//  ProfileScreenContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewProfileScreenProtocol {
    func showItem(_ item: UserProfile)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterProfileScreenProtocol {
    
    var view: PresenterToViewProfileScreenProtocol? { get set }
    var interactor: PresenterToInteractorProfileScreenProtocol? { get set }
    var router: PresenterToRouterProfileScreenProtocol? { get set }
    var data: UserProfile? { get set }
    var passDataCompletion: ((String, String, String, String, String, String, Data) -> ())? { get set }
    func addNewProfile(name: String, date: String, age: String, gender: String, instagramm: String, work: String, image: Data)
    func viewDidLoadDetail() 
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorProfileScreenProtocol {
    
    var presenter: InteractorToPresenterProfileScreenProtocol? { get set }
    var dataManager: UsersDataManagerProtocol? { get set }
    var userItem: UserProfile? { get set }
    var indexPath: IndexPath? { get set }
    
    func createItem(
        item: UserProfile,
        name: String,
        date: String,
        gender: String,
        age: String,
        instagram: String,
        nameOfWork: String,
        personImage: Data
    )

    func deleteItem(item: UserProfile)

    func updateItem(
        item: UserProfile,
        name: String,
        date: String,
        gender: String,
        age: String,
        instagram: String,
        nameOfWork: String,
        personImage: Data
    )
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterProfileScreenProtocol {
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterProfileScreenProtocol {
    
}
