//
//  AppCoordinator.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 02.09.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    
    //MARK: - Private properties
    
    private let window: UIWindow
    
    //MARK: - Initial
    
    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Functions
    
    func start() {
        showTabBar()
    }
    
    private func showTabBar() {
        let tabBarCoordinator = TabBarCoordinator(window: window)
        tabBarCoordinator.start()
    }
}
