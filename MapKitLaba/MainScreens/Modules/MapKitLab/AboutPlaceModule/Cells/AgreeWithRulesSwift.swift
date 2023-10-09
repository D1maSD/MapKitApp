//
//  AgreeWithRulesSwift.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit


final class AgreeWithRulesSwift: Cell {
    
    struct Model {
        var style: ViewStyle<UILabel>
        var text: String
        var bottomOffset: CGFloat?
        var topOffset: CGFloat?
    }
        
    private var descLabel = UILabel(style: .boldTextLabel.compose(with: ViewStyle<UILabel> {
        $0.textAlignment = .left
    }))
    private var agreeWith = UILabel(text: "Agree with rules")
    private var switcher = UISwitch()
    private var model: Model?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    private func setup() {
        contentView.addSubview(descLabel)
        contentView.addSubview(switcher)
        
        NSLayoutConstraint.activate([
            agreeWith.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 35),
            agreeWith.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            agreeWith.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            switcher.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 30),
            switcher.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            switcher.heightAnchor.constraint(equalToConstant: 30),
            switcher.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
