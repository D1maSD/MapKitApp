//
//  LocationImageCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.09.2022.
//

import MapKit
import UIKit
import SnapKit

final class AboutPlaceCell: UITableViewCell {
    
    private var placeImage = UIImageView()
    private var pageControllView = UIView()
    private var shortNameLabel = UILabel()
    private var fullNameLabel = UILabel()
    private var viewModel = AboutPlaceCellVeiwModel()
    private var currentIndex = 0
    private var timer: Timer?
    private var rateRoundButton = RoundButton(frame: .zero)
    private lazy var saveButton = RoundButton(frame: .zero)
    private lazy var rateButton = RoundButton(frame: .zero)
    private lazy var writeTipButton = RoundButton(frame: .zero)
    private var saveLabel = UILabel()
    private var rateLabel = UILabel()
    private var writeLabel = UILabel()
    private var separatorView = UIView()
    private var separatorViewTwo = UIView()
    private var separatorViewThree = UIView()
    private var userAnswearLabel = UILabel()
    private var userButton = RoundButton(frame: .zero)
    private var informationLabel = UILabel()
    private var openLabel = UILabel()
    private var timeIcon = UIImageView()
    private var phoneLabel = UILabel()
    private var phoneIcon = UIImageView()
    private var webSiteLabel = UILabel()
    private var webIcon = UIImageView()
    private var miniMapView = MKMapView()
    private var adressLabel = UILabel()
    private var adressIcon = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setupUI

extension AboutPlaceCell {
    
    private func setupUI() {
        separatorView.backgroundColor = .red
        separatorViewTwo.backgroundColor = .orange
        separatorViewThree.backgroundColor = .yellow
        placeImage.backgroundColor = .systemBrown
        
        shortNameLabel.text = "ЦУМ"
        fullNameLabel.text = "Универмаг в Севастополь"
        
        saveLabel.text = "Сохранить"
        rateLabel.text = "Оценить"
        writeLabel.text = "Написать отзыв"
        userAnswearLabel.text = "Вы были в этом месте"
        
        openLabel.text = "Вероятно открыто"
        phoneLabel.text = "Добавить телефон"
        webSiteLabel.text = "Добавить веб-сайт"
        
        adressLabel.text = "ул. Вакуленчука"
        informationLabel.text = "Информация"
        saveButton.backgroundColor = .systemBlue
        saveButton.setImage(UIImage(named: "time"), for: .normal)
        
        rateRoundButton.backgroundColor = .systemOrange
        rateRoundButton.setImage(UIImage(named: "4.9"), for: .normal)
        
        rateButton.backgroundColor = .systemBlue
        rateButton.setImage(UIImage(named: "time"), for: .normal)
        
        writeTipButton.backgroundColor = .systemBlue
        writeTipButton.setImage(UIImage(named: "time"), for: .normal)
        
        userButton.backgroundColor = .systemRed
        
        timeIcon.image = UIImage(named: "time")
        phoneIcon.image = UIImage(named: "phone")
        webIcon.image = UIImage(named: "web")
        adressIcon.image = UIImage(named: "pin")
    }
}

// MARK: - setupLayout

extension AboutPlaceCell {
    
    private func setUpLayout() {
        self.contentView.backgroundColor = .white
        
        contentView.addSubviewWithTAMIC(pageControllView)
        contentView.addSubviewWithTAMIC(shortNameLabel)
        contentView.addSubviewWithTAMIC(fullNameLabel)
        contentView.addSubviewWithTAMIC(rateRoundButton)
        contentView.addSubviewWithTAMIC(saveButton)
        contentView.addSubviewWithTAMIC(rateButton)
        contentView.addSubviewWithTAMIC(writeTipButton)
        contentView.addSubviewWithTAMIC(saveLabel)
        contentView.addSubviewWithTAMIC(rateLabel)
        contentView.addSubviewWithTAMIC(writeLabel)
        contentView.addSubviewWithTAMIC(separatorView)
        contentView.addSubviewWithTAMIC(separatorViewTwo)
        contentView.addSubviewWithTAMIC(separatorViewThree)
        contentView.addSubviewWithTAMIC(userAnswearLabel)
        contentView.addSubviewWithTAMIC(userButton)
        contentView.addSubviewWithTAMIC(informationLabel)
        contentView.addSubviewWithTAMIC(openLabel)
        contentView.addSubviewWithTAMIC(timeIcon)
        contentView.addSubviewWithTAMIC(phoneLabel)
        contentView.addSubviewWithTAMIC(phoneIcon)
        contentView.addSubviewWithTAMIC(webSiteLabel)
        contentView.addSubviewWithTAMIC(webIcon)
        contentView.addSubviewWithTAMIC(miniMapView)
        contentView.addSubviewWithTAMIC(adressLabel)
        contentView.addSubviewWithTAMIC(adressIcon)
        
        shortNameLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(20)
            $0.top.equalTo(contentView.snp.top).offset(10)
        }
        fullNameLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(20)
            $0.top.equalTo(shortNameLabel.snp.bottom).offset(10)
        }
        rateRoundButton.snp.makeConstraints {
            $0.right.equalTo(contentView.snp.right).offset(-20)
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.height.width.equalTo(64)
        }
        separatorView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(fullNameLabel.snp.bottom).offset(20)
            $0.height.equalTo(17)
        }
        saveButton.snp.makeConstraints {
            $0.left.equalTo(self.contentView.snp.left).offset(40)
            $0.top.equalTo(separatorView.snp.bottom).offset(15)
            $0.height.width.equalTo(50)
        }
        rateButton.snp.makeConstraints {
            $0.centerY.equalTo(saveButton.snp.centerY)
            $0.centerX.equalTo(self.contentView.snp.centerX)
            $0.height.width.equalTo(50)
        }
        writeTipButton.snp.makeConstraints {
            $0.centerY.equalTo(saveButton.snp.centerY)
            $0.right.equalTo(self.contentView.snp.right).offset(-40)
            $0.height.width.equalTo(50)
        }
        saveLabel.snp.makeConstraints {
            $0.centerX.equalTo(saveButton.snp.centerX)
            $0.top.equalTo(saveButton.snp.bottom).offset(6)
        }
        rateLabel.snp.makeConstraints {
            $0.centerX.equalTo(rateButton.snp.centerX)
            $0.centerY.equalTo(saveLabel.snp.centerY)
        }
        writeLabel.snp.makeConstraints {
            $0.centerX.equalTo(writeTipButton.snp.centerX)
            $0.centerY.equalTo(saveLabel.snp.centerY)
        }
        separatorViewTwo.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(writeLabel.snp.bottom).offset(14)
            $0.height.equalTo(17)
        }
        userAnswearLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.right.equalToSuperview()
            $0.top.equalTo(separatorViewTwo.snp.bottom).offset(7)
        }

        userButton.snp.makeConstraints {
            $0.left.equalTo(userAnswearLabel.snp.left)
            $0.top.equalTo(userAnswearLabel.snp.bottom).offset(7)
            $0.height.width.equalTo(25)
        }

        separatorViewThree.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(userButton.snp.bottom).offset(7)
            $0.height.equalTo(17)
        }
        informationLabel.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.top.equalTo(separatorViewThree.snp.bottom).offset(10)
        }
        timeIcon.snp.makeConstraints {
            $0.top.equalTo(informationLabel.snp.bottom).offset(10)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.height.width.equalTo(25)
        }
        openLabel.snp.makeConstraints {
            $0.left.equalTo(timeIcon.snp.right).offset(20)
            $0.centerY.equalTo(timeIcon.snp.centerY)
        }
        phoneIcon.snp.makeConstraints {
            $0.top.equalTo(timeIcon.snp.bottom).offset(10)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.height.width.equalTo(25)
        }
        phoneLabel.snp.makeConstraints {
            $0.left.equalTo(phoneIcon.snp.right).offset(20)
            $0.centerY.equalTo(phoneIcon.snp.centerY)
        }
        webIcon.snp.makeConstraints {
            $0.top.equalTo(phoneIcon.snp.bottom).offset(10)
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.height.width.equalTo(25)
        }
        webSiteLabel.snp.makeConstraints {
            $0.left.equalTo(webIcon.snp.right).offset(20)
            $0.centerY.equalTo(webIcon.snp.centerY)
        }
        miniMapView.snp.makeConstraints {
            $0.right.equalTo(contentView.snp.right)
            $0.left.equalTo(contentView.snp.left)
            $0.top.equalTo(webSiteLabel.snp.bottom).offset(10)
            $0.height.width.equalTo(100)
        }
        adressIcon.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.top.equalTo(miniMapView.snp.bottom).offset(10)
            $0.height.width.equalTo(25)
        }
        adressLabel.snp.makeConstraints {
            $0.left.equalTo(adressIcon.snp.right).offset(20)
            $0.centerY.equalTo(adressIcon.snp.centerY)
        }
    }
}
