//
//  ProfileScreenViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//
//

import UIKit
import SnapKit


final class Some: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpConstraints()
    }
    
    private let nameTextField = OneLine(title: "Имя", subTitle: "Введите имя")
    private let dateTextField = OneLine(title: "Дата", subTitle: "Введите дата")
    private let agePasswordTextField = OneLine(title: "Возраст", subTitle: "Введите возраст")
    private let sexTextField = OneLine(title: "Пол", subTitle: "Введите пол")
    private let instagramTextField = OneLine(title: "instagram", subTitle: "Введите instagram")
    
    private func setUpConstraints() {
        
        let firstStackView = nameTextField
        let secondStackView = dateTextField
        let thirdStackView = agePasswordTextField
        let fourStackView = sexTextField
        let fiveStackView = instagramTextField
        
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        fourStackView.translatesAutoresizingMaskIntoConstraints = false
        fiveStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(firstStackView)
        self.view.addSubview(secondStackView)
        self.view.addSubview(thirdStackView)
        self.view.addSubview(fourStackView)
        self.view.addSubview(fiveStackView)
        
        firstStackView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.bottom).offset(20)
            $0.right.equalTo(self.view.snp.right).offset(-10)
            $0.left.equalTo(self.view.snp.left).offset(10)
            $0.height.equalTo(100)
        }
    }
}


extension Some: PresenterToViewProfileScreenProtocol{
    func showItem(_ item: UserProfile) {
        print("Good")
    }
}
