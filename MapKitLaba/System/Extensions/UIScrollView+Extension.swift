//
//  UIScrollView+Extension.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 19.01.2023.
//

import UIKit
import SnapKit


public extension UIScrollView {
    func scrollTo(horizontalPage: Int? = 0, verticalPage: Int? = 0, animated: Bool? = true) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width * CGFloat(horizontalPage ?? 0)
        frame.origin.y = frame.size.width * CGFloat(verticalPage ?? 0)
        self.scrollRectToVisible(frame, animated: animated ?? true)
    }
    
    func edgeTo(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        self.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(0)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(150)
        }
    }
    func edgeToTo(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        self.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(150)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(150)
        }
    }
}
