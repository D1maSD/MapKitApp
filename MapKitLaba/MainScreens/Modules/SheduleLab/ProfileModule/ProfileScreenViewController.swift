//
//  ProfileScreenViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//
//

import UIKit
import SnapKit


@objc protocol ButtonTapedDelegate {
    func addPhotoButtonTapped()
    func backButtonTapped()
    func editImageButtonTapped()
    func saveButtonTapped()
}


final class ProfileScreenViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoadDetail()
        view.backgroundColor = .white
        setupLayout()
        cancelButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        changePhotoButton.addTarget(self, action: #selector(editImageButtonTapped), for: .touchUpInside)
//        personImageView.imageView.image = UIImage(systemName: "ic_sharp-person")
        
        agePicker.delegate = self
        agePicker.dataSource = self
        genderPicker.delegate = self
        genderPicker.delegate = self
        
        addGesture()
        setupNavigationController()
        
        for num in 0...100 {
            age.append(String(num))
        }
        setupUI()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterProfileScreenProtocol?

    private lazy var imagePicker: ImagePicker = {
        let imagePicker = ImagePicker(
            presentationController: self,
            delegate: self
        )
        return imagePicker
    }()
    
//    private var personImageView = ProfileView()
    private var personImageViewTwo = RoundView()
    private var stackView = UIStackView()
    
    var currentImage: UIImage? {
        didSet { self.setImage(currentImage) }
    }
    
    private var nameLabel = UILabel(text: "Имя")
    private var dateLabel = UILabel(text: "Дата") // number of phone
    private var agePasswordLabel = UILabel(text: "Возраст")
    private var sexPasswordLabel = UILabel(text: "Пол")// useless
    private var instagramPasswordLabel = UILabel(text: "instagram")
    private var whoLabel = UILabel(text: "Вид деятельности") // or company
    private let datePicker = UIDatePicker()
    private let agePicker = UIPickerView()
    private let genderPicker = UIPickerView()
    private let nameLineLabel = OneLineLabel(label: "")
    private let dateLineLabel = OneLineLabel(label: "")
    private let agePasswordLineLabel = OneLineLabel(label: "")
    private let genderLineLabel = OneLineLabel(label: "")
    private let instagramLineLabel = OneLineLabel(label: "")
    private let whoLineLabel = OneLineLabel(label: "")
    private var age: [String] = []
    private var gender: [String] = ["male", "female", "other"]
    private var gesture: UITapGestureRecognizer?
    private let changePhotoButton = UIButton(
        title: "Изменить фото",
        titleColor: .systemGreen,
        backgroundColor: .clear,
        font: .systemFont(ofSize: 20),
        shadow: false
    )
    
    private let cancelButton = UIButton(
        title: "Отмена",
        titleColor: .systemGreen,
        backgroundColor: .clear,
        font: .systemFont(ofSize: 20),
        shadow: false
    )
    
    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 850).isActive = true
        return view
    }()
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let personImageContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return view
    }()
    private let changeButtonContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    private let stackContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 600).isActive = true
        return view
    }()
    private var firstStackView = UIStackView()
    private var secondStackView = UIStackView()
    private var thirdStackView = UIStackView()
    private var fourStackView = UIStackView()
    private var fiveStackView = UIStackView()
    private var sixStackView = UIStackView()
    
    private func addGesture() {
        nameLineLabel.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(nameTaped))
        self.nameLineLabel.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        
        dateLineLabel.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(dateTapped))
        self.dateLineLabel.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        
        agePasswordLineLabel.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(ageTapped))
        self.agePasswordLineLabel.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        
        genderLineLabel.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(genderTapped))
        self.genderLineLabel.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        
        instagramLineLabel.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(instagrammTaped))
        self.instagramLineLabel.addGestureRecognizer(gesture ?? UIGestureRecognizer())
        
        whoLineLabel.isUserInteractionEnabled = true
        gesture = UITapGestureRecognizer(target: self, action: #selector(whoTaped))
        self.whoLineLabel.addGestureRecognizer(gesture ?? UIGestureRecognizer())
    }

    @objc func dateTapped() {
        presentDatePicker(type: .date)
    }
    
    @objc func ageTapped() {
        presentDatePicker(type: .age)
    }
    
    @objc func genderTapped() {
        presentDatePicker(type: .gender)
    }
    
    private func presentDatePicker(type: TypeOfPicker) {
        
        let alertController = UIAlertController(
            title: "\n\n\n\n\n\n\n\n",
            message: nil,
            preferredStyle: .alert
        )
        
        switch type {
        case .date:
            
            datePicker.datePickerMode = .date
            datePicker.backgroundColor = .white
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.frame = CGRect(x: 0, y: 0, width: 270, height: 200)
            var selectAction = UIAlertAction()
            
            alertController.view.addSubview(datePicker)
            
            selectAction = UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
                let timeFormatter = DateFormatter()
                timeFormatter.timeStyle = .none
                timeFormatter.dateStyle = .medium
                
                let strDate = timeFormatter.string(from: self?.datePicker.date ?? Date())
                self?.dateLineLabel.text = strDate
                
                print(strDate)
            })
            alertController.addAction(selectAction)
            
        case .age:
 
            agePicker.frame = CGRect(x: 0, y: 0, width: 270, height: 200)
            var selectAction = UIAlertAction()
            
            alertController.view.addSubview(agePicker)
            selectAction = UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
                
            })
            alertController.addAction(selectAction)
            
        case .gender:
            print("gender")
            
            genderPicker.frame = CGRect(x: 0, y: 0, width: 270, height: 200)
            var selectAction = UIAlertAction()
            
            alertController.view.addSubview(genderPicker)
            selectAction = UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
                
            })
            alertController.addAction(selectAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    public func alertWithTextField(
        title: String? = nil,
        message: String? = nil,
        placeholder: String? = nil,
        label: UILabel? = nil,
        completion: @escaping ((String) -> Void) = { _ in }
    ) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addTextField { newTextField in
                newTextField.placeholder = placeholder
                newTextField.text = label?.text
            }
        
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                print("Cancel tapped")
            }))
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                print("Ok tapped")
                
                if
                    let textFields = alert.textFields,
                    let tf = textFields.first,
                    let result = tf.text
                        
                { completion(result)
                    
                    label?.text = label?.text?.trimmingCharacters(in: .whitespacesAndNewlines)
                    label?.text = result
                    print("result \(result)")
                }
                else
                { completion("") }
            }))
            self.navigationController?.present(alert, animated: true)
        }
    
    @objc func nameTaped() {
        alertWithTextField(title: "Name", message: "", placeholder: "name", label: nameLineLabel) { _ in
            print("Name")
        }
    }
    
    @objc func dateTaped() {
    }

    @objc func genderTaped() {
        alertWithTextField(title: "Gender", message: "", placeholder: "gender", label: genderLineLabel) { _ in
            print("gender")
        }
    }
    
    @objc func instagrammTaped() {
        alertWithTextField(title: "Instagramm", message: "", placeholder: "instagramm", label: instagramLineLabel)
        { _ in
            print("instagramm")
        }
    }
    
    @objc func whoTaped() {
        alertWithTextField(title: "Status", message: "", placeholder: "status", label: whoLineLabel) { _ in
            print("status")
        }
    }
    
        @objc func changePhotoTaped() {
        
        let alert = UIAlertController(title: "Account Exists", message: "There is an account with this email address.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            print("action")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    public func setImage(_ image: UIImage?) {
//        personImageView.setImage(image)
//        personImageView.imageView.image = image
    }
}

extension ProfileScreenViewController {

    func setupStackView() {
        firstStackView = UIStackView(arrangedSubviews: [nameLabel, nameLineLabel])
        firstStackView.axis = .vertical
        firstStackView.spacing = 15
        firstStackView.translatesAutoresizingMaskIntoConstraints = false

        secondStackView = UIStackView(arrangedSubviews: [dateLabel, dateLineLabel])
        secondStackView.axis = .vertical
        secondStackView.spacing = 15
        secondStackView.translatesAutoresizingMaskIntoConstraints = false

        thirdStackView = UIStackView(arrangedSubviews: [agePasswordLabel, agePasswordLineLabel])
        thirdStackView.axis = .vertical
        thirdStackView.spacing = 15
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false

        fourStackView = UIStackView(arrangedSubviews: [sexPasswordLabel, genderLineLabel])
        fourStackView.axis = .vertical
        fourStackView.spacing = 15
        fourStackView.translatesAutoresizingMaskIntoConstraints = false

        fiveStackView = UIStackView(arrangedSubviews: [instagramPasswordLabel, instagramLineLabel])
        fiveStackView.axis = .vertical
        fiveStackView.spacing = 15
        fiveStackView.translatesAutoresizingMaskIntoConstraints = false

        sixStackView = UIStackView(arrangedSubviews: [whoLabel, whoLineLabel])
        sixStackView.axis = .vertical
        sixStackView.spacing = 15
        sixStackView.translatesAutoresizingMaskIntoConstraints = false

        stackView = UIStackView(
            arrangedSubviews: [
                firstStackView, secondStackView,
                thirdStackView, fourStackView,
                fiveStackView, sixStackView
        ])

        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.isUserInteractionEnabled = true
    }


    func setupScrollView() {
        view.addSubview(scrollView)


        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func setupScrollViewContainer() {
        scrollView.addSubview(scrollViewContainer)

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    func setupLayout() {

        setupScrollView()

        // setup fields stackView
        setupStackView()

        setupScrollViewContainer()

        scrollViewContainer.addArrangedSubview(personImageContentView)
        scrollViewContainer.addArrangedSubview(changeButtonContentView)
        scrollViewContainer.addArrangedSubview(stackContentView)
        
        personImageContentView.addSubview(personImageViewTwo)
        personImageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        changeButtonContentView.addSubview(changePhotoButton)
        changePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackContentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        personImageViewTwo.snp.makeConstraints {
            $0.top.equalTo(personImageContentView.snp.top).offset(5)
            $0.height.equalTo(150)
            $0.width.equalTo(150)
            $0.centerX.equalTo(self.personImageContentView.snp.centerX)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(self.stackContentView.snp.top).offset(0)
            $0.left.equalTo(self.stackContentView.snp.left).offset(40)
            $0.right.equalTo(self.stackContentView.snp.right).offset(-40)
            $0.centerX.equalTo(self.stackContentView.snp.centerX)
        }
        changePhotoButton.snp.makeConstraints {
            $0.top.equalTo(self.changeButtonContentView.snp.top).offset(20)
            $0.height.equalTo(30)
            $0.width.equalTo(200)
            $0.centerX.equalTo(self.changeButtonContentView.snp.centerX)
        }

    }
    
    private func addSubview() {
        
    }
    
    private func setupUI() {
        
    }
    
    func popToRootVC() {
        let navController = self.presentingViewController as? UINavigationController
        
        self.dismiss(animated: true) {
            navController?.popToRootViewController(animated: true)
        }
    }
    
    func setupNavigationController() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                title: "Сохранить",
                style: .done,
                target: self,
                action: #selector(saveButtonTapped)
            )
        ]
    }
}


extension ProfileScreenViewController: ButtonTapedDelegate {
    
    func addPhotoButtonTapped() {
        popToRootVC()
    }
    
    func backButtonTapped() {
        popToRootVC()
    }
    
    func editImageButtonTapped() {
        print("editImageButtonTapped")
        imagePicker.alert(isImageEmpty: currentImage == nil ? true : false)
    }
    
    func saveButtonTapped() {
        
        if !(nameLineLabel.text?.isEmpty ?? false), !(whoLineLabel.text?.isEmpty ?? false) {
            
            var jpegImage: Data?
            
            if let _ = personImageViewTwo.image {
                print("IMAGE IF")
                jpegImage = personImageViewTwo.image?.jpegData(compressionQuality: 1.0)
                
            } else {
                print("IMAGE ELSE")
                 let image = UIImage(named: "ic_sharp-person")
                jpegImage = image?.jpegData(compressionQuality: 1.0)
            }
            presenter?.addNewProfile(name: nameLineLabel.text ?? "", date: dateLineLabel.text ?? "", age: agePasswordLineLabel.text ?? "", gender: genderLineLabel.text ?? "", instagramm: instagramLineLabel.text ?? "", work: whoLineLabel.text ?? "", image: jpegImage ?? Data())
        } else {
            Alert.alerts(error: .emptyNameAndJob, view: self)
        }
    }
    // TODO: Implement View Output Methods
}


extension ProfileScreenViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker {
            return age.count
        } else if pickerView == genderPicker {
            return gender.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == agePicker {
            return age[row]
        } else if pickerView == genderPicker {
            return gender[row]
        }
        return "1"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == agePicker {
            agePasswordLineLabel.text = age[row]
        } else if pickerView == genderPicker {
            genderLineLabel.text = gender[row]
        }
    }
}


extension ProfileScreenViewController: PresenterToViewProfileScreenProtocol{
    func showItem(_ item: UserProfile) {
        self.nameLineLabel.text = item.name
        self.dateLineLabel.text = item.date
        self.agePasswordLineLabel.text = item.age
        self.whoLineLabel.text = item.nameOfWork
        self.genderLineLabel.text = item.gender
        self.instagramLineLabel.text = item.instagram
        self.personImageViewTwo.image = UIImage(data: item.personImage ?? Data())
    }
    // TODO: Implement View Output Methods
}

extension ProfileScreenViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        print("didSelect ImagePickerDelegate")
        print("didSelect ImagePickerDelegate")
        print("didSelect ImagePickerDelegate")
        currentImage = image
        personImageViewTwo.image = image
    }
    // TODO: Implement View Output Methods
}
