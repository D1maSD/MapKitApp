//
//  TracsCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit
import SnapKit


final class TracsCell: Cell {
    
    var model: String?
    var albumImageView = UIImageView()
    var trackName = UILabel()

    weak var delegate: TracsImageCellProtocol?
    var gesture: UITapGestureRecognizer?
    
    var artistName = UILabel()
    private var bottomLine = UIView()
    private var moreButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        albumImageView.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.albumImageView.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        setup()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.delegate?.didTapImageView(for: self)
    }

    private func setup() {
        
        trackName.font = .systemFont20Bold
        artistName.minimumScaleFactor = 0.6
        artistName.font = .subtitleBaseDescriptionFont
        
        bottomLine.backgroundColor = .systemGray
        albumImageView.layer.cornerRadius = 4
                
        contentView.addSubview(albumImageView)
        contentView.addSubview(trackName)
        contentView.addSubview(artistName)
        contentView.addSubview(moreButton)
        
        albumImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(25)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        trackName.snp.makeConstraints {
            $0.left.equalTo(albumImageView.snp.right).offset(15)
            $0.top.equalTo(albumImageView.snp.top)
        }
        
        artistName.snp.makeConstraints {
            $0.left.equalTo(albumImageView.snp.right).offset(15)
            $0.top.equalTo(trackName.snp.bottom).offset(6)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


