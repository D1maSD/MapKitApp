//
//  SignInInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

final class SignInInteractor: InteractorInputSignInProtocol {
    
    // MARK: Properties
    var presenter: InteractorOutputSignInProtocol?
    
    func signInAccount(email: String, password: String, view: UIViewController) {
        let responce = JoinCoreDataService.signIn(emailField: email, passwordField: password, view: view)
        presenter?.didRecieve(error: responce)
    }
}
