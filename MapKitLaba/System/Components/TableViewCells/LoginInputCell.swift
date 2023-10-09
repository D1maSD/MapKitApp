//
//  LoginInputCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.11.2022.
//

import UIKit
import SnapKit


final class LoginInputCell: UITableViewCell {
  
  private var textChanged: ((String) -> Void)?
  
  lazy var textField: TextField = {
    let textField = TextField()
    textField.isSecureTextEntry = true
    textField.placeholder = "Enter"
    textField.layer.cornerRadius = 10
    return textField
  }()
  
  lazy var label: UILabel = {
    var label = UILabel()
    label.font = .preferredFont(forTextStyle: .body, compatibleWith: .current)
    label.textColor = .white
    label.textAlignment = .left
    label.text = "Label"
    return label
  }()
  
  private var cellImageView = UIImageView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(textField)
    contentView.addSubview(label)
    contentView.addSubview(cellImageView)
    self.backgroundColor = .clear
    setUpUI()
  }
  
  private func setUpUI() {
    textField.layer.cornerRadius = 10
    textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
      textField.snp.makeConstraints {
          $0.top.equalTo(contentView.snp.top).offset(30)
          $0.bottom.equalTo(contentView.snp.bottom).offset(-30)
          $0.left.equalTo(contentView.snp.left).offset(10)
          $0.right.equalTo(contentView.snp.right).offset(-10)
      }
      label.snp.makeConstraints {
          $0.bottom.equalTo(textField.snp.top).offset(-5)
          $0.left.equalTo(contentView.snp.left).offset(45)
          $0.right.equalTo(contentView.snp.right).offset(-20)
      }
    textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    textField.backgroundColor = .white
    textField.addTarget(self, action: #selector(didTyping), for: .editingChanged)

    cellImageView.frame = CGRect(x: 10, y: -2.5, width: 25, height: 25)
    cellImageView.rightAnchor.constraint(equalTo: label.leftAnchor, constant: -5).isActive = true
    cellImageView.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -5).isActive = true
  }
  @objc func didTyping(_ sender: UITextField) {
    textChanged?(sender.text ?? "")
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
