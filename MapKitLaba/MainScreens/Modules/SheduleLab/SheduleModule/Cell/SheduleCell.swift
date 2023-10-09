//
//  SheduleCell.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit
import SnapKit


final class SheduleCell: Cell {
    
    var model: String?
    private var roundedContentView = UIView()
    var lessonName = UILabel()
    var firstTask = UILabel()
    
    private var secondTask = UILabel()
    private var firstTaskMark = RoundView()
    private var verticalLineView = UIView()
    private var roundedCheckMarkView = RoundButton()
    private var roundedView = RoundView()
    private var markAsDoneButton = UIButton()
    private var deleteButton = UIButton()
    private var doneButtonCount = 1
    
    var gesture: UITapGestureRecognizer?
    weak var delegate: TracsImageCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        roundedContentView.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.roundedContentView.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        
        setup()
        markAsDoneButton.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.delegate?.didTapImageView(for: self)
    }
    
    @objc func buttonDidTapped() {
        doneButtonCount += 1
        if doneButtonCount % 2 == 0 {
            let button = markAsDoneButton
            deleteButton.setImage(UIImage(named: "delete-row"), for: .normal)
            lessonName.textColor = .black
            button.backgroundColor = .systemYellow
            roundedContentView.backgroundColor = .white
            roundedCheckMarkView.backgroundColor = .white
            button.setTitle("Mark as done", for: .normal)
            
        } else {
            let button = markAsDoneButton
            deleteButton.setImage(UIImage(named: "delete-row-white"), for: .normal)
            lessonName.textColor = .white
            button.backgroundColor = .white
            button.setTitle("Marked as done", for: .normal)
            roundedContentView.backgroundColor = .systemYellow
            roundedCheckMarkView.backgroundColor = .systemYellow
        }
    }
    private func setup() {
        deleteButton.setImage(UIImage(named: "delete-row-white"), for: .normal)
        lessonName.minimumScaleFactor = 1
        lessonName.font = .systemFont14Semibold
        lessonName.text = "History"
        lessonName.textColor = .white
        lessonName.translatesAutoresizingMaskIntoConstraints = false
        
        roundedContentView.layer.shadowColor = UIColor.black.cgColor
        roundedContentView.layer.shadowOpacity = 0.12
        roundedContentView.layer.shadowOffset = .zero
        roundedContentView.layer.shadowRadius = 10
        
        firstTask.font = .systemFont14Regular
        secondTask.font = .systemFont14Regular
        
        roundedContentView.layer.cornerRadius = 20
        markAsDoneButton.layer.cornerRadius = 7
        
        firstTaskMark.backgroundColor = .systemGray
        verticalLineView.backgroundColor = .systemYellow
        roundedCheckMarkView.backgroundColor = .systemYellow
        markAsDoneButton.backgroundColor = .white
        roundedView.backgroundColor = .white
        
        roundedView.layer.borderWidth = 2
        roundedView.layer.borderColor = UIColor.systemYellow.cgColor
        
        markAsDoneButton.setTitleColor(.black, for: .normal)
        markAsDoneButton.titleLabel?.font = .systemFont14Medium
        
        firstTask.textColor = .systemGray
        secondTask.textColor = .systemGray
        roundedContentView.backgroundColor = .systemYellow
        
        markAsDoneButton.setTitle("Marked as done", for: .normal)
        
        firstTask.text = "Presentation about Franch in 16 cen..."
        secondTask.text = "Write essay about king Spain Georg ..."
        
        contentView.addSubview(roundedContentView)
        contentView.addSubview(roundedView)
        contentView.addSubview(verticalLineView)
        contentView.addSubview(roundedCheckMarkView)
        
        roundedContentView.addSubview(lessonName)
        roundedContentView.addSubview(firstTask)
        roundedContentView.addSubview(secondTask)
        roundedContentView.addSubview(firstTaskMark)
        roundedContentView.addSubview(markAsDoneButton)
        roundedContentView.addSubview(deleteButton)

        roundedContentView.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-30)
            $0.left.equalToSuperview().offset(60)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.height.equalTo(self.frame.width - 200)
        }
        
        lessonName.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(14)
            $0.top.equalTo(roundedContentView.snp.top).offset(8)
        }
        
        firstTaskMark.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(14)
            $0.top.equalTo(roundedContentView.snp.top).offset(38)
            $0.height.equalTo(3)
            $0.width.equalTo(3)
        }
        
        firstTask.snp.makeConstraints {
            $0.left.equalTo(firstTaskMark.snp.left).offset(8)
            $0.centerY.equalTo(firstTaskMark.snp.centerY)
            $0.width.equalTo(self.frame.width - 200)
        }
        
        markAsDoneButton.snp.makeConstraints {
            $0.right.equalTo(roundedContentView.snp.right).offset(-18)
            $0.bottom.equalTo(roundedContentView.snp.bottom).offset(-9)
            $0.height.equalTo(30)
            $0.width.equalTo(117)
        }
        
        deleteButton.snp.makeConstraints {
            $0.left.equalTo(roundedContentView.snp.left).offset(14)
            $0.bottom.equalTo(roundedContentView.snp.bottom).offset(-9)
            $0.height.equalTo(24)
            $0.width.equalTo(24)
        }
        
        verticalLineView.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(30)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-1)
            $0.top.equalTo(contentView.snp.top).offset(12)
            $0.width.equalTo(2)
        }
        
        roundedView.snp.makeConstraints {
            $0.centerX.equalTo(verticalLineView.snp.centerX)
            $0.top.equalTo(contentView.snp.top)
            $0.height.equalTo(14)
            $0.width.equalTo(14)
        }
        
        roundedCheckMarkView.snp.makeConstraints {
            $0.centerX.equalTo(roundedView.snp.centerX)
            $0.centerY.equalTo(roundedView.snp.centerY)
            $0.height.equalTo(5)
            $0.width.equalTo(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
