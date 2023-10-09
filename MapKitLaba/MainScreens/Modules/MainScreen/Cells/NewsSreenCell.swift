//
//  ContactsCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 05.11.2022.
//

import UIKit
import SnapKit


final class NewsSreenCell: Cell {
    
    private var model: String?
    private var albumImageView = UIImageView()
    private var songTitle = UILabel()
    private var delegate: SomeProtocol?
    private var gesture: UITapGestureRecognizer?
    private var flowName = UILabel()
    private var roundedContentView = UIImageView()
    private var firstLabel = UILabel()
    private var secondLabel = UILabel()
    private var thirdLabel = UILabel()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.delegate?.didTapFlow(for: self)
        
    }

    private func setup() {
        roundedContentView.image = UIImage(named: "contacts")
        flowName.minimumScaleFactor = 1
        flowName.font = .systemFont32Black
        flowName.text = "News"
        flowName.textColor = .white
        flowName.translatesAutoresizingMaskIntoConstraints = false
        
        firstLabel.font = .systemFont14Regular
        firstLabel.text = "John Silver"
        firstLabel.textColor = .white
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        secondLabel.font = .systemFont14Regular
        secondLabel.text = "Dr. Livsey"
        secondLabel.textColor = UIColor(named: "Color-1")
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        roundedContentView.layer.cornerRadius = 20
            
        contentView.addSubview(roundedContentView)
        roundedContentView.addSubview(flowName)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(thirdLabel)
        roundedContentView.backgroundColor = .clear

        roundedContentView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.height.equalTo(self.frame.width - 200)
        }
        
        flowName.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(36)
            $0.top.equalTo(roundedContentView.snp.top).offset(13)
        }
                
        firstLabel.snp.makeConstraints {
            $0.right.equalTo(roundedContentView.snp.right).offset(-35)
            $0.top.equalTo(flowName.snp.bottom).offset(13)
            
        }
        
        secondLabel.snp.makeConstraints {
            $0.right.equalTo(roundedContentView.snp.right).offset(-35)
            $0.top.equalTo(firstLabel.snp.bottom).offset(13)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
