//
//  SignUpRouter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit

final class SignUpRouter: RouterInputSignUpProtocol {
    
    weak var rootViewController: UIViewController?
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = SignUpViewController()
        
        let presenter: ViewInputSignUpProtocol & InteractorOutputSignUpProtocol = SignUpPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SignUpRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SignUpInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func openAuthScreen(with login: String) {
        
        print("openAuthScreen")
        let viewController = SignInRouter.createModule()
        
        rootViewController?.present(viewController, animated: true, completion: {
            print("SignInViewController presented")
        })
    }
    
    
    
    func showAlert(error type: TypesOfAlert) {
        
    }
}
