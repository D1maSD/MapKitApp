//
//  RoundButton.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 27.09.2022.
//

import UIKit

final class RoundButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.masksToBounds = true
        layer.cornerRadius = .maximum(frame.width, frame.height) / 2.0
    }
}
