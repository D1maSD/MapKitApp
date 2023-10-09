//
//  NewsItem.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 22.12.2022.
//

import Foundation
import UIKit


struct NewsItem {
    
    var newsMaker: String
    var title: String
    var info: String
    var likes: Int
    var dislikes: Int
    var stars: Int
    var image: UIImage
    var timePassed: String
    
    init(
        newsMaker: String,
        title: String,
        info: String,
        likes: Int,
        dislikes: Int,
        stars: Int,
        image: UIImage,
        timePassed: String
    ) {
        self.newsMaker = newsMaker
        self.title = title
        self.info = info
        self.likes = likes
        self.dislikes = dislikes
        self.stars = stars
        self.image = image
        self.timePassed = timePassed
    }
}
