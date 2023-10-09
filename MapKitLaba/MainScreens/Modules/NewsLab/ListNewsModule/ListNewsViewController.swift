//
//  NewsLabViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import UIKit

final class ListNewsLabViewController: UIViewController {
    
    private var news: [NewsItem] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.logoTitleFont,
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }
    
    
    // MARK: - Properties
    var presenter: ViewToPresenterNewsLabProtocol?
    private var tableView = UITableView()
    
}

extension ListNewsLabViewController: PresenterToViewNewsLabProtocol{
    // TODO: Implement View Output Methods
    func setNews(news: [NewsItem]) {
        self.news = news
    }
}

extension ListNewsLabViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: NewsCell = tableView.dequeueReusableCell(for: indexPath)
        cell.newsMaker.text = news[indexPath.row].title
        cell.title.text = news[indexPath.row].info
        cell.newsImageView.image = news[indexPath.row].image
        cell.time.text = news[indexPath.row].timePassed
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectNews = news[indexPath.row]
        
        presenter?.openSelectedNewsViewController(on: self, news: selectNews)
    }
}

extension ListNewsLabViewController {
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: "\(NewsCell.self)")
    }
}
