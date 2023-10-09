//
//  SignUpInteractor.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation



final class SignUpInteractor: InteractorInputSignUpProtocol {
    var presenter: InteractorOutputSignUpProtocol?
    
    func createAccount(
        login: String,
        email: String,
        password: String,
        confirmPassword: String
    ) {
        print("createAccount")
        
        print("signUpTapped  3  ")
        
        let response = JoinCoreDataService.signUp(
            loginField: login,
            emailField: email,
            passwordField: password,
            confirmField: confirmPassword
        )
        
        presenter?.didRecieve(error: response)
    }
}
