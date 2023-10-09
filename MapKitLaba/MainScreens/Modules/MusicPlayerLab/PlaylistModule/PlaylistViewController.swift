//
//  PlaylistViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import UIKit
import MusicKit

final class PlaylistViewController: UIViewController, TracsImageCellProtocol {
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    private var songs: [Song] = [] {
        didSet {
            tableView.reloadData()
            print("songs DIDSET.COUNT \(songs.count)")
        }
    }
    private var filteredSongs: [Song] = []
    
    func didTapImageView(for cell: Cell) {
        switch cell {
        case is TracsCell:
            print("some")
        default:
            print("no")
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
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
        self.additionalSafeAreaInsets.top = 0
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
        self.navigationController?.navigationBar.frame.size = (self.navigationController?.navigationBar.sizeThatFits(CGSize(width: (self.navigationController?.navigationBar.frame.size.width)!, height: 54)))!
        
        
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
        print(navigationBarHeight)
    }
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TracsCell.self, forCellReuseIdentifier: "\(TracsCell.self)")
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterPlaylistProtocol?
    
    private var tableView = UITableView()
    
}

extension PlaylistViewController: PresenterToViewPlaylistProtocol{
    // TODO: Implement View Output Methods
    
    func setSongs(model: [Song]) {
        self.songs = model
    }
}

extension PlaylistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var song: Song
        
        if isFiltering {
            song = filteredSongs[indexPath.row]
        } else {
            song = songs[indexPath.row]
        }
        
        
        let cell: TracsCell = tableView.dequeueReusableCell(for: indexPath)
        DispatchQueue.main.async {
            cell.albumImageView.image = UIImage(named: song.imageName)
            cell.trackName.text = song.name
            cell.artistName.text = song.artistName
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredSongs.count
        }
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var song: [Song]
        
        if isFiltering {
            song = filteredSongs
        } else {
            song = songs
        }
        presenter?.showPlayer(with: song, at: indexPath)
    }
    
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var currentModel: Song
        
        if isFiltering {
            currentModel = filteredSongs[indexPath.row]
        } else {
            currentModel = songs[indexPath.row]
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            
            self?.presenter?.deleteTapped(at: indexPath)
            self?.tableView.reloadRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}


extension PlaylistViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredSearchedContent(searchController.searchBar.text!)
    }
    
    private func filteredSearchedContent(_ text: String) {
        
        filteredSongs = songs.filter { (song: Song) in
            return song.name.lowercased().contains(text.lowercased())
        }
        tableView.reloadData()
    }
}
