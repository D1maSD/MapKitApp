//
//  Alerts.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 27.11.2022.
//

import Foundation
import UIKit


final class Alert: NSObject {
    
    func showAlert(view: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        view.present(alert, animated: true, completion: nil)
    }
    
    
    static func alerts(error type: TypesOfAlert, view: UIViewController) {
        switch type {
        case .emptyFields:
            Alert().showAlert(
                view: view,
                title: "Error",
                message: "Not all fields are filled in"
            )
        case .accountExists:
            Alert().showAlert(
                view: view,
                title: "Account Exists",
                message: "There is an account with this email address."
            )
        case .accountNotFound:
            Alert().showAlert(
                view: view,
                title: "Error",
                message: "Not found account with this email"
            )
        case .regSuccessful:
            Alert().showAlert(
                view: view,
                title: "Registration Successful",
                message: "You are redirected to the login page"
            )
        case .passwordsNotMuch:
            Alert().showAlert(
                view: view,
                title: "Password Error",
                message: "Passwords do not match"
            )
        case .registrationFailed:
            Alert().showAlert(
                view: view,
                title: "Registration failed",
                message: "Check email and password"
            )
        case .randomSystemError:
            Alert().showAlert(
                view: view,
                title: "Error",
                message: "Some system error. Please try again."
            )
        case .passwordError:
            Alert().showAlert(
                view: view,
                title: "Error",
                message: "Minimum 8 characters at least 1 Alphabet and 1 Number"
            )
        case .emailError:
            Alert().showAlert(
                view: view,
                title: "Error",
                message: "Email entered incorrectly"
            )
        case .emailOrPasswordError:
            Alert().showAlert(
                view: view,
                title: "Error",
                message: "Email or password entered incorrectly"
            )
        case .loginExists:
            Alert().showAlert(
                view: view,
                title: "Login Exists",
                message: "There is an account with this login address."
            )
        case .emailExists:
            Alert().showAlert(
                view: view,
                title: "Email Exists",
                message: "There is an account with this email address."
            )
        case .emptyNameAndJob:
            Alert().showAlert(
                view: view,
                title: "Error",
                message: "Name must be entry"
            )
        case .titleIsEmpty:
            Alert().showAlert(
                view: view,
                title: "Error",
                message: "Title can not be empty"
            )
        }
    }
    
   
}
