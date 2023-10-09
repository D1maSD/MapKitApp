//
//  FollowingNewsModuleViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import UIKit

final class FollowingNewsModuleViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterFollowingNewsModuleProtocol?
    
}

extension FollowingNewsModuleViewController: PresenterToViewFollowingNewsModuleProtocol{
    // TODO: Implement View Output Methods
}
