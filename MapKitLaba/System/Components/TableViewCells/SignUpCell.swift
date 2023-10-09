//
//  SignUpCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 23.10.2022.
//

import UIKit
import CoreData

final class SignUpCell: Cell {
    
    private var signInButton = UIButton()
    private var signUpButton = UIButton()
    private var switcher = UISwitch()
    private var agreeWith = UILabel(text: "Agree with rules")
    private var orLabel = UILabel(style: .boldTextLabel.compose(with: ViewStyle<UILabel> {
        $0.textAlignment = .center
    }))
    
    struct Model {
        var style: ViewStyle<UIButton>
        var title: String
        var didTap: () -> Void
    }
    private var model: String? {
        didSet {
            self.emailTextField = BaseTextField(model ?? "")
        }
    }
    private var loginModel: String? {
        didSet {
            self.loginTextField = BaseTextField(loginModel ?? "")
        }
    }
    private var passwordModel: String? {
            didSet {
                self.passwordTextField = BaseTextField(passwordModel ?? "")
        }
    }
    private var confirmPasswordModel: String? {
            didSet {
                self.confirmPasswordTextField = BaseTextField(confirmPasswordModel ?? "")
        }
    }
    private var loginTextField: BaseTextField! {
        didSet {
            setup()
        }
    }
    private var emailTextField = BaseTextField()
    private var passwordTextField = BaseTextField()
    private var confirmPasswordTextField = BaseTextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        signInButton.setTitle("Sign In", for: .normal)
        signInButton = UIButton(style: .sighUpButtonStyle)
        
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton = UIButton(style: .sighUpButtonStyle)
        orLabel.text = "Or"
    }
    
    private func setup() {
        
        contentView.addSubview(loginTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(confirmPasswordTextField)
        contentView.addSubview(orLabel)
        contentView.addSubview(switcher)
        contentView.addSubview(agreeWith)
        
        self.contentView.addSubview(signInButton)
        self.contentView.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(loginTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
        
        confirmPasswordTextField.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
        
        agreeWith.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(35)
            $0.left.equalTo(contentView.snp.left).offset(20)
            $0.width.equalTo(200)
        }
        
        switcher.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(35)
            $0.right.equalTo(contentView.snp.right).offset(-20)
            $0.width.equalTo(50)
            $0.height.equalTo(30)
        }
        
        signUpButton.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(25)
            $0.right.equalTo(contentView.snp.right).offset(-25)
            $0.top.equalTo(switcher.snp.bottom).offset(30)
            $0.height.equalTo(67)
            $0.centerX.equalTo(contentView.snp.centerX)
        }
        
        
        orLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(25)
            $0.right.equalTo(contentView.snp.right).offset(-25)
            $0.top.equalTo(signUpButton.snp.bottom).offset(30)
//            $0.bottom.equalToSuperview().offset(bottomOffset)
//            $0.centerX.centerY.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.right.equalToSuperview().offset(-25)
            $0.top.equalTo(orLabel.snp.bottom).offset(15)
            $0.height.equalTo(67)
            $0.centerX.equalTo(loginTextField.snp.centerX)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func signInTapped() {
        
    }
    
    @objc func prito() {
        
        print("emailTextField.text")
        print("passwordTextField.text")
    }
}






