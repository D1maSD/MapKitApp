//
//  CustomTabBarController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 08.10.2022.
//

import UIKit


// create tabBarController

final class CustomTabBarController: UITabBarController {
    
    private let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        middleButton()
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.backgroundColor = .systemGray
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = UIScreen.main.bounds.width / 4
        
        viewControllers = [
            generateNavigationController(controller: MainScreenRouter.createModule(), image: UIImage(named: "gridicons") ?? UIImage()),
            generateNavigationController(controller: SignUpRouter.createModule(), image: UIImage(named: "today") ?? UIImage()),
            generateNavigationController(controller: SignInRouter.createModule(), image: UIImage(named: "gridicons") ?? UIImage()),
            generateNavigationController(controller: AboutPlaceCellView(), image: UIImage(named: "gridicons") ?? UIImage()),
            generateNavigationController(controller: ThirdViewController(), image: UIImage(named: "gridicons") ?? UIImage())
        ]
    }
    
    private func middleButton() {
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 25, y: 10, width: 60, height: 60))
        middleButton.setBackgroundImage(UIImage(named: "middleButton"), for: .normal)
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.tabBar.bringSubviewToFront(middleButton)
        middleButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
    }
    
    private func generateNavigationController(controller: UIViewController,
                                      image: UIImage) ->
    UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.tabBarItem.image = image
        return navigationController
    }
}
