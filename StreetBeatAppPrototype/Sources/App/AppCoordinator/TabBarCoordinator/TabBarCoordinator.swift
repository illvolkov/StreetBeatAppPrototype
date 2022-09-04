//
//  TabBarCoordinator.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 02.09.2022.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    //MARK: - Private properties
    
    private let window: UIWindow
    
    //MARK: - Initial
    
    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Functions
    
    func start() {
        let tabBarController = TabBarController()
        
        let catalogCoordinator = CatalogCoordinator(navigationController: UINavigationController(rootViewController: CatalogController()))
        catalogCoordinator.start()
        
        tabBarController.viewControllers = [
            tabBarController.generate(viewController: catalogCoordinator.navigationController!,
                                      image: UIImage(named: "glass"),
                                      selectedImage: UIImage(named: "glass.selected"))
        ]
        
        
        window.rootViewController = tabBarController
    }
}
