//
//  BooksViewModel.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 27.03.2023.
//

import Foundation


protocol BooksVeiwModelProtocol {
    var router: BooksRouter? { get set }
    var view: BooksViewControllerProtocol? { get set }
    
}

class BooksViewModel: BooksVeiwModelProtocol {
    var router: BooksRouter?
    
    var view: BooksViewControllerProtocol?
    
    
}
