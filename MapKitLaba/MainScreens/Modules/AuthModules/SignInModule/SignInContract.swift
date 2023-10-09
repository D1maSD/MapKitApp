//
//  SignInContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol ViewOutputSignInProtocol {
    
    func showAlert(error type: TypesOfAlert)
    
}


// MARK: View Input (View -> Presenter)
protocol ViewInputSignInProtocol {
    
    var view: ViewOutputSignInProtocol? { get set }
    var interactor: InteractorInputSignInProtocol? { get set }
    var router: RouterInputSignInProtocol? { get set }
    
    func signIn(email: String, password: String, view: UIViewController)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol InteractorInputSignInProtocol {
    
    var presenter: InteractorOutputSignInProtocol? { get set }
    
    func signInAccount(email: String, password: String, view: UIViewController)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorOutputSignInProtocol {
    func didRecieve(error: TypesOfAlert)
}


// MARK: Router Input (Presenter -> Router)
protocol RouterInputSignInProtocol {
    
}
