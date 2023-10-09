//
//  ContactsCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 18.11.2022.
//


import UIKit
import SnapKit


final class ContactCell: Cell {
    
    private var model: String?
    var albumImageView = RoundView()
    var personName = UILabel()
    weak var delegate: ContactCellProtocol? // universal protocol
    private var gesture: UILongPressGestureRecognizer?
    private var newsText = UILabel()
    var lessonNameLabel = UILabel()
    private var bottomLine = UIView()
    private var moreButton = UIButton()
    private let bottomView = UIView(frame: CGRect.zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        albumImageView.isUserInteractionEnabled = true
        gesture?.minimumPressDuration = 1.0
        gesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(handleTap(gesture:))
        )
        gesture?.delaysTouchesEnded = true
        
        self.albumImageView.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        setup()
    }

    @objc func handleTap(gesture:UIGestureRecognizer) {
        
        if gesture.state == .began {
            if delegate != nil {
                self.delegate?.didTapImageView(for: self)
            }
        }
    }
    
    private func setup() {
        self.bottomView.backgroundColor = UIColor.systemGray
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        personName.font = .text18SemiboldFont
        lessonNameLabel.text = "Гражданское право"
        lessonNameLabel.minimumScaleFactor = 0.4
        lessonNameLabel.font = .subtitleBaseDescriptionFont
        
        bottomLine.backgroundColor = .systemGray
        contentView.addSubview(albumImageView)
        contentView.addSubview(personName)
        contentView.addSubview(lessonNameLabel)
        contentView.addSubview(moreButton)
        contentView.addSubview(bottomView)
        
        personName.text = "Помазуновский Игнатий Сергеевич"
        personName.numberOfLines = 2
        
        albumImageView.image = UIImage(named: "ic_sharp-person")
        
        albumImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.top.equalTo(bottomView.snp.top).offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }

        personName.snp.makeConstraints {
            $0.left.equalTo(albumImageView.snp.right).offset(15)
            $0.right.equalTo(contentView.snp.right).offset(-15)
            $0.top.equalTo(bottomView.snp.top).offset(12)
        }
        
        lessonNameLabel.snp.makeConstraints {
            $0.left.equalTo(albumImageView.snp.right).offset(15)
            $0.top.equalTo(personName.snp.bottom).offset(6)
        }
        
        bottomView.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(15)
            $0.right.equalTo(contentView.snp.right).offset(-15)
            $0.top.equalTo(contentView.snp.top)
            $0.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


