//
//  SheduleLabContract.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSheduleLabProtocol: AnyObject {
    func setModel(model: [Note])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSheduleLabProtocol: AnyObject {
    
    var view: PresenterToViewSheduleLabProtocol? { get set }
    var interactor: PresenterToInteractorSheduleLabProtocol? { get set }
    var router: PresenterToRouterSheduleLabProtocol? { get set }
    var models: [Note]? { get set }
    
    func numberOfRowsInSection() -> Int
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
    func viewDidLoad()
    func addDidTapped()
    func deleteTapped(note: Note)
    func showScreen(from: UIViewController, view: SheduleScreens)
    func showTodoDetail(_ Note: Note, with indexPath: IndexPath)
    func viewWillAppear()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSheduleLabProtocol: AnyObject {
    
    var presenter: InteractorToPresenterSheduleLabProtocol? { get set }
    
    var dataManager: NoteDataManagerProtocol? { get set }
    
    func fetchFrom() -> [Note]?
    func deleteTapped(note: Note)
    func retrieveNotes()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSheduleLabProtocol: AnyObject {
    func didRetrieveNotes(_ notes: [Note])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSheduleLabProtocol: AnyObject {
    func showScreen(from: UIViewController, view: SheduleScreens)
    func presentNoteDetailScreen(
        from view: PresenterToViewSheduleLabProtocol,
        _ note: Note,
        with indexPath: IndexPath
    )
}
