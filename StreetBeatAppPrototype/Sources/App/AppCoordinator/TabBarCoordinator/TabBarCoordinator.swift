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
        let favoritesCoordinator = FavoritesCoordinator(navigationController: UINavigationController(rootViewController: FavoritesController()))
        favoritesCoordinator.start()
        
        tabBarController.viewControllers = [
            tabBarController.generate(viewController: catalogCoordinator.navigationController,
                                      image: UIImage(named: "glass"),
                                      selectedImage: UIImage(named: "glass.selected")),
            tabBarController.generate(viewController: favoritesCoordinator.navigationController,
                                      image: UIImage(named: "heart"),
                                      selectedImage: UIImage(named: "heart.selected"))
        ]
        
        
        window.rootViewController = tabBarController
    }
}
