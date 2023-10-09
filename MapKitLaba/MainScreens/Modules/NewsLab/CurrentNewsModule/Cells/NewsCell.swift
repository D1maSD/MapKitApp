//
//  NewsCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit


final class NewsCell: Cell {
    
    private var model: String?
    var newsImageView = UIImageView()
    var newsMaker = UILabel()
    var title = UILabel()
    var time = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
        newsMaker.font = .systemFont20Bold
        newsMaker.numberOfLines = 5
        title.backgroundColor = .clear
        title.textAlignment = .left
        title.numberOfLines = 5
        title.minimumScaleFactor = 0.8
        title.adjustsFontSizeToFitWidth = true
        title.font = .systemFont20Bold
        time.minimumScaleFactor = 0.6
        time.font = .subtitleBaseDescriptionFont
        
        contentView.addSubview(newsImageView)
        contentView.addSubview(newsMaker)
        contentView.addSubview(title)
        contentView.addSubview(time)
        
        newsImageView.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.height.equalTo(140)
            $0.width.equalTo(140)
        }
        newsMaker.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalTo(newsImageView.snp.left).offset(-20)
            $0.top.equalToSuperview().offset(10)
        }
        time.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-4)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
