//
//  ProfileScreenInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation

final class ProfileScreenInteractor: PresenterToInteractorProfileScreenProtocol {
    // MARK: Properties
    var presenter: InteractorToPresenterProfileScreenProtocol?
    var dataManager: UsersDataManagerProtocol?
    var userItem: UserProfile?
    var indexPath: IndexPath?
    
    func createItem(item: UserProfile, name: String, date: String, gender: String, age: String, instagram: String, nameOfWork: String, personImage: Data) {

        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            if self.indexPath != nil {

                self.dataManager?.updateItem(
                    item: self.userItem ?? UserProfile(),
                    name: name,
                    date: date,
                    gender: gender,
                    age: age,
                    instagram: instagram,
                    nameOfWork: nameOfWork,
                    personImage: personImage,
                    indexPath: self.indexPath ?? IndexPath()
                )
            } else {

                self.dataManager?.createItem(name: name, date: date, gender: gender, age: age, instagram: instagram, nameOfWork: nameOfWork, personImage: personImage)
            }
        }
    }
    
    func deleteItem(item: UserProfile) {
        dataManager?.deleteItem(item: item)
    }
    
    func updateItem(item: UserProfile, name: String, date: String, gender: String, age: String, instagram: String, nameOfWork: String, personImage: Data) {
    }
}
