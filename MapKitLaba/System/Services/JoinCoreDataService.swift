//
//  SignUpService.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 02.11.2022.
//

import UIKit
import CoreData


class JoinCoreDataService {
    // MARK: - signUp
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
    
    static var logins = [String]()
    static var emails = [String]()
    static var passwords = [String]()
    static func signUp(
        loginField: String,
        emailField: String,
        passwordField: String,
        confirmField: String
    ) -> TypesOfAlert {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(
            forEntityName: "UserEntitiy",
            into: context
        )
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitiy")
                
        
        //MARK: Check fields are not empty and validate
        
        if passwordField.isEmpty || confirmField.isEmpty || loginField.isEmpty || emailField.isEmpty {
            return .emptyFields
        }
        
        if !emailField.isValidEmail(email: emailField) {
            return .emailError
            
        }
        
        if !passwordField.isValidPassword(password: passwordField) {
            return .passwordError
        }
        
        do {
            let results = try context.fetch(fetchRequest)
            
            //MARK: Check for account exists
            
            for result in results as! [NSManagedObject] {
                
                let mail = result.value(forKey: "email") as? String
                let login = result.value(forKey: "id") as? String
                
                if emailField == mail {
                    return .emailExists
                }
                
                if loginField == login {
                    return .loginExists
                }
            }
                        
            //MARK: if passwordField == confirmField
            if (passwordField == confirmField) {
                
                
                //MARK: password.setValue  mail.setValue
                newUser.setValue(passwordField, forKey: "password")
                newUser.setValue(emailField, forKey: "email")
                newUser.setValue(loginField, forKey: "id")
                try context.save()
                
                print(newUser)
                return .regSuccessful
                
                
                //MARK: alert Password Error
            } else {
                return .passwordsNotMuch
            }
            
        } catch let error as NSError {
            
            print(error.localizedDescription)
            return .randomSystemError
        }
    }
    
    
    
    static func signIn(emailField: String, passwordField: String, view: UIViewController) -> TypesOfAlert {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntitiy")
        
        //MARK: Check fields are not empty and validate
        
        if passwordField.isEmpty || emailField.isEmpty {
            return .emptyFields
        }
        
        do {
            let results = try context.fetch(fetchRequest)
            
            //MARK: Check for account exists
            
            for result in results as! [NSManagedObject] {
                
                let mail = result.value(forKey: "email") as? String
                let password = result.value(forKey: "password") as? String
                let login = result.value(forKey: "id") as? String
                
                if login != nil {
                    logins.append(login!)

                }
                if mail != nil {
                    emails.append(mail!)

                }
                if password != nil {
                    passwords.append(password!)

                }
                
            }
            
            if logins != nil {
                for i in logins {
                }
            }
            
            if emails != nil {
                for i in emails {
                }
            }
            
            if ((emails.contains(emailField)) != nil) {
            } else {
            }
            
            if ((passwords.contains(passwordField)) != nil) {
            } else {
            }
            
            
            if emails.contains(emailField) ?? false && ((passwords.contains(passwordField)) != nil) {
                    view.navigationController?.pushViewController(
                        MainScreenRouter.createModule(),
                        animated: true
                    )
                    return .accountExists

            } else if logins.contains(emailField) ?? false && passwords.contains(passwordField) ?? false {
                    print("Sign in mach")
                    view.navigationController?.pushViewController(
                        MainScreenRouter.createModule(),
                        animated: true
                    )
                    return .accountExists

            } else if emails.contains(emailField) ?? false && !(passwords.contains(passwordField) ?? false) {
                    return .emailOrPasswordError

            } else if !(logins.contains(emailField) ?? false) || !(emails.contains(emailField) ?? false) && passwords.contains(passwordField) ?? false {
                    return .emailOrPasswordError
                }
//            }
            
        } catch let error as NSError {
            
            print(error.localizedDescription)
            return .randomSystemError
        }
        return .randomSystemError
    }
}
