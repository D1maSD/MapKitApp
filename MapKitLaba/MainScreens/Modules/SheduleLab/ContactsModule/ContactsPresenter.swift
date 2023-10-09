//
//  ContactsPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 18.11.2022.
//  
//

import UIKit


final class ContactsPresenter: ViewToPresenterContactsProtocol {
    
    var contactsArray: [ContactsEntity]?
    var models: [UserProfile]?
    // MARK: Properties
    var view: PresenterToViewContactsProtocol?
    var interactor: PresenterToInteractorContactsProtocol?
    var router: PresenterToRouterContactsProtocol?
    
    func viewDidLoad() {
        addDidTapped()
    }
    
    func viewWillAppear() {
        interactor?.retrieveItems()
        
        let state = interactor?.fetchFrom()
        models = state
        view?.setModel(model: state ?? [UserProfile]())
    }
    
    func addDidTapped() {
        let state = interactor?.fetchFrom()
        models = state
        view?.setModel(model: state ?? [UserProfile]())
    }
    
    func deleteTapped(item: UserProfile) {
        interactor?.deleteTapped(item: item)
    }
    
    func showScreen(from: UIViewController, view: SheduleScreens) {
        router?.showScreen(from: from, view: view)
    }
    
    func showProfileDetail(_ item: UserProfile, with indexPath: IndexPath) {
        guard let view = view else {
            return }
        
        router?.presentProfileDetailScreen(from: view, item, with: indexPath)
    }
    
    func userDidPicked(_ item: [UserProfile], indexPath: IndexPath) {
        interactor?.userDidPicked(item[indexPath.row], indexPath: indexPath)
    }
}

extension ContactsPresenter: InteractorToPresenterContactsProtocol {
    func didRetrieveItems(items: [UserProfile]) {
        view?.setModel(model: items)
    }
}
