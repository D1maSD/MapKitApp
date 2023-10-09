//
//  MainScreenViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.11.2022.
//  
//

import UIKit


final class MainScreenViewController: UIViewController, SomeProtocol, PlayerCellProtocol{
    func didTapImageView(for cell: PlayerCell) {
    }
    
    
    
    @objc func didTapFlow(for cell: Cell) {
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.logoTitleFont,
        ]
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
    }

    
    // MARK: - Properties
    var presenter: ViewToPresenterMainScreenProtocol?
    private var tableView = UITableView()
    
}

extension MainScreenViewController: PresenterToViewMainScreenProtocol{
    // TODO: Implement View Output Methods
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: MapCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell: PlayerCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell: SheduleCellTwo = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell: NewsSreenCell = tableView.dequeueReusableCell(for: indexPath)
            cell.selectionStyle = .none
            return cell
        default:
            fatalError("Index out of range")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            presenter?.presentFlow(view: self, flow: .mapKitFlow)
        case 1:
            presenter?.presentFlow(view: self, flow: .playerFlow)
        case 2:
            presenter?.presentFlow(view: self, flow: .sheduleKitFlow)
        case 3:
            presenter?.presentFlow(view: self, flow: .newsFlow)
        default:
            print("Row not handled")
        }
    }
}

extension MainScreenViewController {
    
    private func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MapCell.self, forCellReuseIdentifier: "\(MapCell.self)")
        tableView.register(SheduleCellTwo.self, forCellReuseIdentifier: "\(SheduleCellTwo.self)")
        tableView.register(PlayerCell.self, forCellReuseIdentifier: "\(PlayerCell.self)")
        tableView.register(NewsSreenCell.self, forCellReuseIdentifier: "\(NewsSreenCell.self)")
        tableView.register(BooksSreenCell.self, forCellReuseIdentifier: "\(BooksSreenCell.self)")
    }
}
