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
        let streetBeatCoordinator = StreetBeatCoordinator(navigationController: UINavigationController(rootViewController: StreetBeatController()))
        streetBeatCoordinator.start()
        let basketCoordinator = BasketCoordinator(navigationController: UINavigationController(rootViewController: BasketController()))
        basketCoordinator.start()
        let myInfoCoordinator = MyInfoCoordinator(navigationController: UINavigationController(rootViewController: MyInfoController()))
        myInfoCoordinator.start()
        
        tabBarController.viewControllers = [
            tabBarController.generate(viewController: catalogCoordinator.navigationController,
                                      image: UIImage(named: "glass"),
                                      selectedImage: UIImage(named: "glass.selected")),
            tabBarController.generate(viewController: favoritesCoordinator.navigationController,
                                      image: UIImage(named: "heart"),
                                      selectedImage: UIImage(named: "heart.selected")),
            tabBarController.generate(viewController: streetBeatCoordinator.navigationController,
                                      image: UIImage(named: "streetBeat"),
                                      selectedImage: UIImage(named: "streetBeat.selected")),
            tabBarController.generate(viewController: basketCoordinator.navigationController,
                                      image: UIImage(named: "basket"),
                                      selectedImage: UIImage(named: "basket.selected")),
            tabBarController.generate(viewController: myInfoCoordinator.navigationController,
                                      image: UIImage(named: "person"),
                                      selectedImage: UIImage(named: "person.selected"))
        ]
        
        tabBarController.selectedIndex = 2
        
        window.rootViewController = tabBarController
    }
}
