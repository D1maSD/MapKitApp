//
//  SignUpViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import UIKit
import SnapKit
import CoreData

final class SignUpViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orLabel.text = "Or"
        signInButton = UIButton(style: .sighUpButtonStyle)
        signUpButton = UIButton(style: .sighUpButtonStyle)
        
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signInButton.setTitle("Sign In", for: .normal)
        
        self.view.backgroundColor = .white
        setup()
    }
    
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
        view.heightAnchor.constraint(equalToConstant: 750).isActive = true
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loginTextField: TextField = {
        let textField = TextField()
        textField.isSecureTextEntry = false
        textField.placeholder = "Login"
        textField.layer.cornerRadius = 10
        textField.autocapitalizationType = .none
        textField.backgroundColor = .defaultGrayTextFieldColor
        return textField
    }()
    
    lazy var emailTextField: TextField = {
        let textField = TextField()
        textField.isSecureTextEntry = false
        textField.placeholder = "Email"
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
    
    lazy var confirmPasswordTextField: TextField = {
        let textField = TextField()
        textField.isSecureTextEntry = false
        textField.placeholder = "Confirm password"
        textField.layer.cornerRadius = 10
        textField.autocapitalizationType = .none
        textField.backgroundColor = .defaultGrayTextFieldColor
        return textField
    }()
    
    
    
    
    // MARK: - Properties
    // MARK: View Input (View -> Presenter)
    var presenter: ViewInputSignUpProtocol?
    
    // MARK: View Input (View -> Output)
    private var output: ViewOutputSignUpProtocol?
    
    
    
    struct Model {
        var style: ViewStyle<UIButton>
        var title: String
        var didTap: () -> Void
    }
    
    private var signInButton = UIButton()
    private var signUpButton = UIButton()
    private var switcher = UISwitch()
    private var agreeWith = UILabel(text: "Agree with rules")
    private var passwordArray = [String]()
    private var mailArray = [String]()
    private var orLabel = UILabel(style: .boldTextLabel.compose(with: ViewStyle<UILabel> {
        $0.textAlignment = .center
    }))
    
    
    
    // MARK: - signInTapped
    @objc func signInTapped() {
        self.navigationController?.pushViewController(SignInRouter.createModule(), animated: true)
    }
    
    
    // MARK: - setUpLayout
    private func setup() {
        
        view.addSubview(loginTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(orLabel)
        view.addSubview(switcher)
        view.addSubview(agreeWith)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        restInfoContentView.addSubview(emailTextField)
        restInfoContentView.addSubview(passwordTextField)
        restInfoContentView.addSubview(orLabel)
        restInfoContentView.addSubview(signInButton)
        restInfoContentView.addSubview(signUpButton)
        restInfoContentView.addSubview(agreeWith)
        restInfoContentView.addSubview(switcher)
        restInfoContentView.addSubview(confirmPasswordTextField)
        restInfoContentView.addSubview(loginTextField)
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(restInfoContentView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(restInfoContentView.snp.top).offset(120)
            $0.centerX.equalTo(restInfoContentView.snp.centerX)
        }
        
        emailTextField.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(loginTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(emailTextField.snp.centerX)
        }
        
        confirmPasswordTextField.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(emailTextField.snp.centerX)
        }

        agreeWith.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(35)
            $0.left.equalTo(restInfoContentView.snp.left).offset(20)
            $0.width.equalTo(200)
        }
        
        switcher.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(35)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.width.equalTo(50)
            $0.height.equalTo(30)
        }
        
        signUpButton.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.top.equalTo(switcher.snp.bottom).offset(30)
            $0.height.equalTo(67)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        
        orLabel.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.top.equalTo(signUpButton.snp.bottom).offset(30)
            //            $0.bottom.equalToSuperview().offset(bottomOffset)
            //            $0.centerX.centerY.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(25)
            $0.right.equalTo(restInfoContentView.snp.right).offset(-25)
            $0.top.equalTo(orLabel.snp.bottom).offset(15)
            $0.height.equalTo(67)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
    }
}


extension SignUpViewController: ViewOutputSignUpProtocol {
    // TODO: Implement View Output Methods
    
    // MARK: - signUpTapped
    
    @objc func signUpTapped() {
        
        presenter?.signUp(loginField: loginTextField.text ?? "", emailField: emailTextField.text ?? "", passwordField: passwordTextField.text ?? "", confirmField: confirmPasswordTextField.text ?? "")
    }
    
    func showAlert(error type: TypesOfAlert) {
        
        Alert.alerts(error: type, view: self)
    }
}
