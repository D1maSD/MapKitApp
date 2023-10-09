//
//  FollowingNewsModulePresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import Foundation

final class FollowingNewsModulePresenter: ViewToPresenterFollowingNewsModuleProtocol {

    // MARK: Properties
    var view: PresenterToViewFollowingNewsModuleProtocol?
    var interactor: PresenterToInteractorFollowingNewsModuleProtocol?
    var router: PresenterToRouterFollowingNewsModuleProtocol?
}

extension FollowingNewsModulePresenter: InteractorToPresenterFollowingNewsModuleProtocol {
    
}
