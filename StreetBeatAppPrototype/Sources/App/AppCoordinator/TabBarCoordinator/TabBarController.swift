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
        
        generateTabBar()
    }
        
    private func generateTabBar() {
        viewControllers = [
            generate(viewController: CatalogController(),
                     image: UIImage(named: "glass"),
                     selectedImage: UIImage(named: "glass.selected"))
        ]
    }
    
    private func generate(viewController: UIViewController, image: UIImage?, selectedImage: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        return viewController
    }
}
