//
//  ProfileScreenPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

final class ProfileScreenPresenter: ViewToPresenterProfileScreenProtocol {

    // MARK: Properties
    var view: PresenterToViewProfileScreenProtocol?
    var interactor: PresenterToInteractorProfileScreenProtocol?
    var router: PresenterToRouterProfileScreenProtocol?
    
    var passDataCompletion: ((String, String, String, String, String, String, Data) -> ())?
    var data: UserProfile?
    
    func viewDidLoadDetail() {
        if let profileItem = interactor?.userItem {
            view?.showItem(profileItem)
        }
    }
    
    func addNewProfile(name: String, date: String, age: String, gender: String, instagramm: String, work: String, image: Data) {
                
        self.interactor?.createItem(item: UserProfile(), name: name, date: date, gender: gender, age: age, instagram: instagramm, nameOfWork: work, personImage: image)
    }
}

extension ProfileScreenPresenter: InteractorToPresenterProfileScreenProtocol {
    
}
