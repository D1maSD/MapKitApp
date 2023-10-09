//
//  SheduleLabPresenter.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.10.2022.
//  
//

import UIKit


final class SheduleLabPresenter: ViewToPresenterSheduleLabProtocol {
    
    // MARK: Properties
    var view: PresenterToViewSheduleLabProtocol?
    var interactor: PresenterToInteractorSheduleLabProtocol?
    var router: PresenterToRouterSheduleLabProtocol?
    var sheduleNubers: Int? = 8
    var models: [Note]?
    
    
    func viewDidLoad() {
        addDidTapped()
    }
    
    func addDidTapped() {
        
        let state = interactor?.fetchFrom()
        models = state
        view?.setModel(model: state ?? [Note]())
    }
    
    func deleteTapped(note: Note) {
        interactor?.deleteTapped(note: note)
    }
    
    func showTodoDetail(_ Note: Note, with indexPath: IndexPath) {
        guard let view = view else {
            return }
        
        router?.presentNoteDetailScreen(from: view, Note, with: indexPath)
        
    }
    
    func viewWillAppear() {
        interactor?.retrieveNotes()
    }
    
    
    func showScreen(from: UIViewController, view: SheduleScreens) {
        router?.showScreen(from: from, view: view)
    }
    
    // MARK: - Inputs from view
    func numberOfRowsInSection() -> Int {
        guard let sheduleNubers = self.sheduleNubers else {
            return 0
        }
        return sheduleNubers
    }
    
    func didSelectRowAt(index: Int) {
    }
    
    func deselectRowAt(index: Int) {
    }
}

extension SheduleLabPresenter: InteractorToPresenterSheduleLabProtocol {
    func didRetrieveNotes(_ notes: [Note]) {
        view?.setModel(model: notes)
    }
}
