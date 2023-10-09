//
//  GradientView.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 27.03.2023.
//

import Foundation
import UIKit


class GradientVeiw: UIView {
    
    var gradientLayer = CAGradientLayer()
    
    private var startColor: UIColor? {
        didSet {
            setUpGradientColors(startColors: startColor, endColor: endColor)
        }
    }
    
    private var endColor: UIColor? {
        didSet {
            setUpGradientColors(startColors: startColor, endColor: endColor)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpGradientColors(startColors: startColor, endColor: endColor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpGradient(startPoint: .leading, endPoint: .trailing, startColor: startColor, endColor: endColor)
    }
    

    
    
    enum Points {
        case topLeading
        case bottomLeading
        case topTrailing
        case bottomTrailing
        case leading
        case trailing
        case top
        case bottom
        case center
        
        var point: CGPoint {
            switch self {
            case .topLeading:
                return CGPoint(x: 0, y: 0)
            case .bottomLeading:
                return CGPoint(x: 0, y: 1)
            case .topTrailing:
                return CGPoint(x: 1, y: 0)
            case .bottomTrailing:
                return CGPoint(x: 0, y: 1)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .bottom:
                return CGPoint(x: 0.5, y: 1)
            case .leading:
                return CGPoint(x: 0, y: 0.5)
            case .trailing:
                return CGPoint(x: 1, y: 0.5)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientLayer.frame = bounds
    }
    
    func setUpGradient(startPoint: Points, endPoint: Points, startColor: UIColor?, endColor: UIColor?) {
        self.layer.addSublayer(gradientLayer)
        setUpGradientColors(startColors: startColor, endColor: endColor)
        gradientLayer.startPoint = startPoint.point
        gradientLayer.endPoint = endPoint.point
    }
    
    func setUpGradientColors(startColors: UIColor?, endColor: UIColor?) {
        if let startColor = startColors, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    
    init(from: Points, to: Points, startColor: UIColor?, endColor: UIColor?) {
        self.init()
        setUpGradient(startPoint: from, endPoint: to, startColor: startColor, endColor: endColor)
    }
    
}

