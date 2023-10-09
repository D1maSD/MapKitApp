//
//  UITextField + Extension.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.10.2022.
//

import UIKit
import SnapKit


final class OneLineLabel: UILabel {
    
    let bottomView = UIView(frame: CGRect.zero)
    
    convenience init(label: String) {
        self.init()
        self.backgroundColor = .clear
        self.text = label
        self.bottomView.backgroundColor = UIColor.systemGray
        setUpConstraints()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpConstraints() {
        self.addSubview(bottomView)

        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}



final class OneLine: UILabel {
    
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    convenience init(title: String, subTitle: String) {
        self.init()
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
    }
    
    let bottomView = UIView(frame: CGRect.zero)
    
    func setUpConstraints() {
        
        titleLabel.textAlignment = .left
        subTitleLabel.textAlignment = .left
        
        self.addSubview(bottomView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
                
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 15),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])

        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension UITextField {
    
    func trimmingWhiteSpaces(_ textField: UITextField, replacementString: String) -> String {
        var text = textField.text
        if replacementString == "  " {
            text = textField.text?.replacingOccurrences(of: "  ", with: "")
            return text ?? ""
        }
        return text ?? ""
    }
}
