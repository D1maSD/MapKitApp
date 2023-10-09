//
//  SheduleLabViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import UIKit

final class SheduleLabViewController: UIViewController, TracsImageCellProtocol {
    
    // MARK: - Properties
    var presenter: ViewToPresenterSheduleLabProtocol?
    private var tableView = UITableView()
    var savedPersonShared = SavedNote.shared
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
           return searchController.isActive && !searchBarIsEmpty
       }
    private var models: [Note] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private var filteredModels: [Note] = []
    
    let vc2 = NoteViewController()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupNavigationController()
        presenter?.viewDidLoad()
        // MARK: setup searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    func didTapImageView(for cell: Cell) {
        
        let navigationController = UINavigationController(rootViewController: vc2)
        self.navigationController?.modalPresentationStyle = UIModalPresentationStyle.popover
        self.navigationController?.present(navigationController, animated: true, completion: {
        })
        
        self.navigationController?.popToRootViewController(animated: true)
    }
 
    @objc func addNewNoteButton() {
        presenter?.addDidTapped()
        presenter?.showScreen(from: self, view: .note)
        self.savedPersonShared.selectedPerson = nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
}


extension SheduleLabViewController: PresenterToViewSheduleLabProtocol {
    // TODO: Implement View Output Methods
    func setModel(model: [Note]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        self.models = model
    }
}


extension SheduleLabViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case indexPath.row:
            
            var note: Note
                    
                    if isFiltering {
                        note = filteredModels[indexPath.row]
                    } else {
                        note = models[indexPath.row]
                    }
            
            let cell: NoteCell = tableView.dequeueReusableCell(for: indexPath)
            cell.firstTask.text = note.note
            cell.lessonName.text = note.title
            cell.personProfileImage.image = UIImage(data: note.personImage ?? Data())
            
            cell.delegate = self
            return cell
        default:
            fatalError("Index out of range")
        }
    }
    
    private func setupNavigationController() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(named: "plus"),
                style: .done,
                target: self,
                action: #selector(addNewNoteButton)
            )
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredModels.count
        }
        return models.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                
        var currentModel: Note
                
                if isFiltering {
                    currentModel = filteredModels[indexPath.row]
                } else {
                    currentModel = models[indexPath.row]
                }
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (action, view, completionHandler) in
            
            self?.savedPersonShared.selectedPerson = nil
            //MARK: SHOW TODO DETAIL
            self?.presenter?.showTodoDetail(currentModel, with: indexPath)
            self?.tableView.beginUpdates()
            self?.tableView.reloadRows(at: [indexPath], with: .fade)
            self?.tableView.endUpdates()
            completionHandler(true)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            
            self?.presenter?.deleteTapped(note: currentModel)
            self?.presenter?.addDidTapped()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [editAction, deleteAction])
    }
}


extension SheduleLabViewController {
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.allowsSelectionDuringEditing = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BaseDescriptionCell.self, forCellReuseIdentifier: "\(BaseDescriptionCell.self)")
        tableView.register(NoteCell.self, forCellReuseIdentifier: "\(NoteCell.self)")
        tableView.register(SheduleCell.self, forCellReuseIdentifier: "\(SheduleCell.self)")
    }
}

extension SheduleLabViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredSearchedContent(searchController.searchBar.text!)
    }
    
    private func filteredSearchedContent(_ text: String) {
        filteredModels = models.filter { (note: Note) in
            return note.title?.lowercased().contains(text.lowercased()) as! Bool
        }
        tableView.reloadData()
    }
}
