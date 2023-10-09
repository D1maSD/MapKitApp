//
//  ContactsViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 18.11.2022.
//  
//

import UIKit

final class ContactsViewController: UIViewController, ContactCellProtocol {
    
    private var userDataManagerSingletone = UserDataManager.shared
    private var selectedItem: UserProfile? {
        return userDataManagerSingletone.updateSelected()
    }
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
           return searchController.isActive && !searchBarIsEmpty
    }
    private var models = [UserProfile]()
    private var filteredModels: [UserProfile] = []
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private let vc2 = ProfileScreenRouter.createModule()
    
    private let longPress = UILongPressGestureRecognizer(target: ContactsViewController.self, action: #selector(handleLongTap(sender:)))
    
    @objc func handleLongTap(sender: UILongPressGestureRecognizer) {
        
    }
    
    func didTapImageView(for cell: ContactCell) {
        let vc = ProfileScreenRouter.createModule()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        tableView.addGestureRecognizer(longPress)
        setupNavigationController()
        presenter?.viewDidLoad()
        configureTableView()
        setupLayout()
        setUpUI()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.additionalSafeAreaInsets.top = 0
        presenter?.viewWillAppear()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupNavigationController() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(named: "add"),
                style: .done,
                target: self,
                action: #selector(addDidTap)
            )
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.navigationBar.frame.size = (self.navigationController?.navigationBar.sizeThatFits(CGSize(width: (self.navigationController?.navigationBar.frame.size.width)!, height: 54)))!
        
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
    }
    
    func configureTableView() {
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ContactCell.self, forCellReuseIdentifier: "\(ContactCell.self)")
    }
    
    func setUpUI() {
//        cancelButton.addTarget(self, action: #selector(cancelDidTapped), for: .touchUpInside)
    }
    
    func setupLayout() {
//        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        addPersonButton.translatesAutoresizingMaskIntoConstraints = false
        
//        self.view.addSubview(cancelButton)
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(150)
            $0.bottom.equalTo(self.view.snp.bottom)
            $0.left.equalTo(self.view.snp.left)
            $0.right.equalTo(self.view.snp.right)
        }
    }
    
    @objc func cancelDidTapped() {
        print("cancelDidTapped()")
        let navController = self.presentingViewController as? UINavigationController
        self.dismiss(animated: true) {
            navController?.dismiss(animated: true)
//            navController?.popToRootViewController(animated: true)
        }
    }
    
    @objc func addDidTap() {
        presenter?.addDidTapped()
        presenter?.showScreen(from: self, view: .profile)
    }
  
    // MARK: - Properties
    
    private var tableView = UITableView()
    
//    let cancelButton = UIButton(title: "Cancel", titleColor: .systemGreen, backgroundColor: .clear, font: .systemFont(ofSize: 20), shadow: false)
    let addPersonButton = UIButton()

    // MARK: - Properties
    var presenter: ViewToPresenterContactsProtocol?
}


extension ContactsViewController: PresenterToViewContactsProtocol {
    func printSomeInfo() {
    }
    
    func setModel(model: [UserProfile]) {
        DispatchQueue.main.async {
            self.models = model
            self.tableView.reloadData()
        }
    }
    // TODO: Implement View Output Methods
}


extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var model: UserProfile
                if isFiltering {
                    model = filteredModels[indexPath.row]
                } else {
                    model = models[indexPath.row]
                }
        let cell: ContactCell = tableView.dequeueReusableCell(for: indexPath)
        cell.personName.text = model.name
        cell.albumImageView.image = UIImage(data: model.personImage ?? Data())
        cell.lessonNameLabel.text = model.nameOfWork
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredModels.count
        }
        return models.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var profile: [UserProfile]
                if isFiltering {
                    profile = filteredModels
                } else {
                    profile = models
                }
        self.presenter?.userDidPicked(profile, indexPath: indexPath)
        self.cancelDidTapped()
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let item = models[indexPath.row]
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, completionHandler) in
            self?.presenter?.showProfileDetail(item, with: indexPath)
            self?.tableView.beginUpdates()
            self?.tableView.reloadRows(at: [indexPath], with: .fade)
            self?.tableView.endUpdates()
            completionHandler(true)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            
            self?.presenter?.deleteTapped(item: item)
            self?.presenter?.addDidTapped()
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [editAction, deleteAction])
    }
}

extension ContactsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredSearchedContent(searchController.searchBar.text!)
    }
    
    private func filteredSearchedContent(_ text: String) {
        
        filteredModels = models.filter { (profile: UserProfile) in
            //MARK: FIXME as! Bool
            return profile.name?.lowercased().contains(text.lowercased()) as! Bool
        }
        tableView.reloadData()
    }
}
