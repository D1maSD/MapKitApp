//
//  SignInViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import UIKit
import SnapKit
import CoreData


final class SignInViewController: UIViewController {
    
    
    // MARK: - Properties
    var presenter: ViewInputSignInProtocol?
    private var signInButton = UIButton()
    private var signUpButton = UIButton()
    private var result = NSArray()
    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()

        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let restInfoContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 700).isActive = true
        return view
    }()
    
    private var passwordArray = [String]()
    private var mailArray = [String]()
    private var orLabel = UILabel(style: .boldTextLabel.compose(with: ViewStyle<UILabel> {
        $0.textAlignment = .center
    }))
    
    lazy var emailTextField: TextField = {
        let textField = TextField()
        textField.isSecureTextEntry = false
        textField.placeholder = "Login or email"
        textField.layer.cornerRadius = 10
        textField.autocapitalizationType = .none
        textField.backgroundColor = .defaultGrayTextFieldColor
        return textField
    }()
    
    lazy var passwordTextField: TextField = {
        let textField = TextField()
        textField.isSecureTextEntry = false
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 10
        textField.autocapitalizationType = .none
        textField.backgroundColor = .defaultGrayTextFieldColor
        return textField
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
}



extension SignInViewController {
    
    private func setupConstraints() {
        
        restInfoContentView.addSubview(emailTextField)
        restInfoContentView.addSubview(passwordTextField)
        restInfoContentView.addSubview(orLabel)
        
        restInfoContentView.addSubview(signInButton)
        restInfoContentView.addSubview(signUpButton)
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(restInfoContentView)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        emailTextField.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(restInfoContentView.snp.top).offset(140)
            $0.centerX.equalTo(restInfoContentView.snp.centerX)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(emailTextField.snp.centerX)
        }
        
        signInButton.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.bottom.equalTo(orLabel.snp.top).offset(-30)
            $0.height.equalTo(67)
            $0.centerX.equalTo(emailTextField.snp.centerX)
        }
        
        orLabel.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.bottom.equalTo(signUpButton.snp.top).offset(-15)
        }
        
        signUpButton.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.bottom.equalTo(restInfoContentView.snp.bottom).offset(-150)
            $0.height.equalTo(67)
            $0.centerX.equalTo(emailTextField.snp.centerX)
        }
    }
    
    private func setupUI() {
        orLabel.text = "Or"
        
        signInButton = UIButton(style: .sighUpButtonStyle)
        signUpButton = UIButton(style: .sighUpButtonStyle)
        
        signInButton.setTitle("Sign In", for: .normal)
        signUpButton.setTitle("Sign Up", for: .normal)
        
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        passwordTextField.isSecureTextEntry = true
        view.backgroundColor = .white
    }
}



extension SignInViewController: ViewOutputSignInProtocol {
    
    func showAlert(error type: TypesOfAlert) {
        
        Alert.alerts(error: type, view: self)
    }
    
    @objc func signInTapped() {
        
        print("signInTapped")
        presenter?.signIn(
            email: emailTextField.text ?? "",
            password: passwordTextField.text ?? "",
            view: self
        )
    }
    
    @objc func signUpTapped() {
        print("signUpTapped")
        self.navigationController?.pushViewController(
            SignUpRouter.createModule(),
            animated: true
        )
    }
    // TODO: Implement View Output Methods
}
