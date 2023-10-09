//
//  Protocols.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 11.10.2022.
//

import Foundation


@objc protocol SomeProtocol {
    func didTapFlow(for cell: Cell)
}

@objc protocol TracsImageCellProtocol {
    func didTapImageView(for cell: Cell)
}

@objc protocol MainScreenCellProtocol {
    func didTapImageView(for cell: SheduleCellTwo)
}

@objc protocol MapCellProtocol {
    func didTapImageView(for cell: Cell)
}

@objc protocol PlayerCellProtocol {
    func didTapImageView(for cell: PlayerCell)
}

@objc protocol ContactsCellProtocol {
    func didTapImageView(for cell: NewsCell)
}

@objc protocol ContactCellProtocol {
    func didTapImageView(for cell: ContactCell)
}

protocol MapViewArray {
    associatedtype MapArray
    
    var places: [MapArray]? { get set }
}

protocol UsersDataManagerProtocol {
    
    var models: [UserProfile] { get set }
    
    func updateSelected() -> UserProfile
    func getAllItems()
    func updateModels() -> [UserProfile]
    func createItem(
        name: String,
        date: String,
        gender: String,
        age: String,
        instagram: String,
        nameOfWork: String,
        personImage: Data
    )
    
    func deleteItem(item: UserProfile)
    
    func updateItem(
        item: UserProfile,
        name: String,
        date: String,
        gender: String,
        age: String,
        instagram: String,
        nameOfWork: String,
        personImage: Data,
        indexPath: IndexPath
    )
}

protocol PresenterWillOpenPopover {
    
}


protocol NoteDataManagerProtocol {
    
    var models: [Note] { get set }
    var userDataManager: UsersDataManagerProtocol? { get set }
    
    func getAllNotes()
    func updateModels() -> [Note]
    
    func createNote(
        title: String,
        note: String,
        date: Date,
        selectedItem: UserProfile?
    )
    
    func deleteNote(item: Note)
    
    func updateItemWithSelectedContact(
        item: Note,
        title: String,
        note: String,
        indexPath: IndexPath,
        selectedItem: UserProfile
    )
    
    func updateItemWithNoContact(
        item: Note,
        title: String,
        note: String,
        indexPath: IndexPath,
        selectedItem: UserProfile
    )
    
}
