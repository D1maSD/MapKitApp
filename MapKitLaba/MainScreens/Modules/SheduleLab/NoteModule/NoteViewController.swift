//
//  NoteViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 07.11.2022.
//  
//

import UIKit
import SnapKit


final class NoteViewController: UIViewController {
    
    
    private var titleField = UITextField()
    private var noteTextView = UITextView()
    private var addPerson = UIButton()
    private var addPersonImageView = RoundView()
    private var personImageView = RoundView()
    private var addPersonNameLabel = UILabel()
    private var personNameLabel = UILabel()
    private var passDataCompletion: ((String, String) -> ())?
    private var baseString = "Добавить человека или организацию"
    private var moreBaseString = "Дополнительная информация"
    private let gesture = UITapGestureRecognizer()
    private var moreInfoLabel = UILabel()
    private var moreInfoLabelTwo = UILabel()
    
    private let cancelButton = UIButton(title: "Cancel", titleColor: .systemGreen, backgroundColor: .clear, font: .systemFont(ofSize: 20), shadow: false)
    private let saveButton = UIButton(title: "Save", titleColor: .systemGreen, backgroundColor: .clear, font: .systemFont(ofSize: 20), shadow: false)
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()

        presenter?.viewDidLoadDetail()
        setupNavigationController()
        setupLayout()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        presenter?.viewWillAppearDetail()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterNoteProtocol?
    func setupNavigationController() {
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                title: "Сохранить",
                style: .done,
                target: self,
                action: #selector(saveDidTapped)
            )
        ]
    }

    @objc func addPersonDidTapped() {
        presenter?.showScreen(from: self, view: .contacts)
    }
    
    @objc func saveDidTapped() {
        // MARK: NEW CODE
        if let title = titleField.text, !title.isEmpty {
            presenter?.createNote(title: title, note: noteTextView.text ?? "", date: Date())
        } else {
            Alert.alerts(error: .titleIsEmpty, view: self)
        }
    }
}

extension NoteViewController: PresenterToViewNoteProtocol {
    // TODO: Implement View Output Methods
        
    func showPerson(_ userProfile: UserProfile) {

    }
    
    func showNote(_ note: Note, _ userProfile: UserProfile) {
        titleField.text = note.title
        noteTextView.text = note.note
        personNameLabel.text = note.personName ?? baseString
        moreInfoLabelTwo.text = note.statusOrCompany ?? moreBaseString
        personImageView.image = UIImage(data: note.personImage ?? Data())
    }
}

extension NoteViewController {
    
    private func setupLayout() {
        self.view.addSubview(cancelButton)
        self.view.addSubview(titleField)
        self.view.addSubview(noteTextView)
        self.view.addSubview(addPerson)
        self.view.addSubview(addPersonImageView)
        self.view.addSubview(addPersonNameLabel)
        self.view.addSubview(moreInfoLabel)
        self.view.addSubview(personImageView)
        self.view.addSubview(personNameLabel)
        self.view.addSubview(moreInfoLabelTwo)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        titleField.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        addPersonImageView.translatesAutoresizingMaskIntoConstraints = false
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleField.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(150)
            $0.height.equalTo(30)
            $0.right.equalTo(self.view.snp.right).offset(-30)
            $0.left.equalTo(self.view.snp.left).offset(30)
        }
        
        noteTextView.snp.makeConstraints {
            $0.top.equalTo(titleField.snp.bottom).offset(20)
            $0.right.equalTo(self.view.snp.right).offset(-10)
            $0.left.equalTo(self.view.snp.left).offset(10)
            //            $0.bottom.equalTo(self.view.snp.bottom).offset(-10)
            $0.height.equalTo(250)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(50)
            $0.height.equalTo(20)
            $0.width.equalTo(120)
            $0.left.equalTo(self.view.snp.left)
        }
        
        addPersonImageView.snp.makeConstraints {
            $0.left.equalTo(self.view.snp.left).offset(18)
            $0.top.equalTo(noteTextView.snp.bottom).offset(70)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        addPersonNameLabel.snp.makeConstraints {
            $0.left.equalTo(addPersonImageView.snp.right).offset(15)
            $0.right.equalTo(self.view.snp.right).offset(-15)
            $0.top.equalTo(addPersonImageView.snp.top)
        }
        
        moreInfoLabel.snp.makeConstraints {
            $0.left.equalTo(addPersonImageView.snp.right).offset(15)
            $0.top.equalTo(addPersonNameLabel.snp.bottom).offset(6)
        }
        
        personImageView.snp.makeConstraints {
            $0.left.equalTo(self.view.snp.left).offset(18)
            $0.top.equalTo(addPersonImageView.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        personNameLabel.snp.makeConstraints {
            $0.left.equalTo(personImageView.snp.right).offset(15)
            $0.right.equalTo(self.view.snp.right).offset(-15)
            $0.top.equalTo(personImageView.snp.top)
        }
        
        moreInfoLabelTwo.snp.makeConstraints {
            $0.left.equalTo(personImageView.snp.right).offset(15)
            $0.top.equalTo(personNameLabel.snp.bottom).offset(6)
        }
    }
    
    private func setUpUI() {
        saveButton.addTarget(self, action: #selector(saveDidTapped), for: .touchUpInside)
        
        addPerson.setTitleColor(.black, for: .normal)
        addPerson.titleLabel?.font = .systemFont14Medium
        addPerson.layer.cornerRadius = 7
        addPerson.backgroundColor = .systemYellow
        addPerson.setTitle("Add person", for: .normal)
        
        addPersonImageView.image = UIImage(named: "add")
        addPersonImageView.addGestureRecognizer(gesture)
        addPersonImageView.isUserInteractionEnabled = true
        addPersonImageView.backgroundColor = .systemGray2
        
//        personImageView.image = UIImage(named: "add")
//        personImageView.addGestureRecognizer(gesture)
        personImageView.isUserInteractionEnabled = true
//        personImageView.backgroundColor = .systemGray2

        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        gesture.addTarget(self, action: #selector(addPersonDidTapped))

        addPersonNameLabel.text = "Добавить человека или организацию"
        addPersonNameLabel.textColor = .systemGray2
        addPersonNameLabel.font = .text18SemiboldFont
        
//        personNameLabel.text = baseString
        personNameLabel.textColor = .systemGray2
        personNameLabel.font = .text18SemiboldFont
        
        moreInfoLabel.textColor = .systemGray2
        moreInfoLabel.text = moreBaseString
        moreInfoLabel.minimumScaleFactor = 0.4
        moreInfoLabel.font = .subtitleBaseDescriptionFont
        
        moreInfoLabelTwo.textColor = .systemGray2
        moreInfoLabelTwo.minimumScaleFactor = 0.4
        moreInfoLabelTwo.font = .subtitleBaseDescriptionFont
        
        titleField.borderStyle = .line
        titleField.layer.cornerRadius = 5
        
        self.view.backgroundColor = .white
    }
}
