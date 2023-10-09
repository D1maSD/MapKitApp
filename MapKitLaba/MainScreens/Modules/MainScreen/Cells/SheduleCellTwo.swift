//
//  MainScreenCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 05.11.2022.
//

import UIKit
import SnapKit


final class SheduleCellTwo: Cell {
    
    private var model: String?
    private var albumImageView = UIImageView()
    private var songTitle = UILabel()
    private var delegate: SomeProtocol?
    private var gesture: UITapGestureRecognizer?
    private var flowName = UILabel()
    private var roundedContentView = UIImageView()
    private var firstIcon = UIImageView()
    private var secondIcon = UIImageView()
    private var thirdIcon = UIImageView()
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
        
        songTitle.font = .systemFont20Bold
        songTitle.textColor = .white
        roundedContentView.image = UIImage(named: "shedule")
        
        flowName.minimumScaleFactor = 1
        flowName.font = .systemFont32Black
        flowName.text = "Shedule"
        flowName.textColor = .white
        flowName.translatesAutoresizingMaskIntoConstraints = false
        
        firstLabel.font = .systemFont14Regular
        firstLabel.text = "- Call to mama"
        firstLabel.textColor = .white
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        secondLabel.font = .systemFont14Regular
        secondLabel.text = "- Check email"
        secondLabel.textColor = UIColor(named: "Color-1")
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstIcon.image = UIImage(named: "firstCheckMark")
        firstIcon.translatesAutoresizingMaskIntoConstraints = false
        
        secondIcon.image = UIImage(named: "secondCheckMark")
        secondIcon.translatesAutoresizingMaskIntoConstraints = false
        
        roundedContentView.layer.cornerRadius = 20
                
        contentView.addSubview(roundedContentView)
        
        roundedContentView.addSubview(flowName)
        roundedContentView.addSubview(firstIcon)
        roundedContentView.addSubview(secondIcon)
        roundedContentView.addSubview(firstLabel)
        roundedContentView.addSubview(secondLabel)            
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
        
        firstIcon.snp.makeConstraints {
            $0.right.equalTo(roundedContentView.snp.right).offset(-35)
            $0.top.equalTo(flowName.snp.bottom).offset(13)
            $0.height.equalTo(14)
            $0.width.equalTo(14)
        }
        
        secondIcon.snp.makeConstraints {
            $0.right.equalTo(roundedContentView.snp.right).offset(-35)
            $0.top.equalTo(firstIcon.snp.bottom).offset(13)
            $0.height.equalTo(14)
            $0.width.equalTo(14)
        }
        
        firstLabel.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(35)
            $0.centerY.equalTo(firstIcon.snp.centerY)
        }
        
        secondLabel.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(35)
            $0.centerY.equalTo(secondIcon.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
