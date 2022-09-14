//
//  TabBarController.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 02.09.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .white
    }
    
    //MARK: - Functions
    
    func generate(viewController: UIViewController?, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        if let viewController = viewController {
            viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
            viewController.tabBarItem.image = image?.withRenderingMode(.alwaysOriginal)
            viewController.tabBarItem.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
            return viewController
        }
        return UIViewController()
    }
}
