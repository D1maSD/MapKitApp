//
//  SignInPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

final class SignInPresenter: ViewInputSignInProtocol {
    func signIn(email: String, password: String, view: UIViewController) {
        interactor?.signInAccount(
            email: email,
            password: password,
            view: view
        )
    }
    

    // MARK: Properties
    var view: ViewOutputSignInProtocol?
    var interactor: InteractorInputSignInProtocol?
    var router: RouterInputSignInProtocol?
}

extension SignInPresenter: InteractorOutputSignInProtocol {
    func didRecieve(error: TypesOfAlert) {
        view?.showAlert(error: error)
    }
    
    
}

extension SignInPresenter: ViewOutputSignInProtocol {
    
    func showAlert(error type: TypesOfAlert) {
    }
}
