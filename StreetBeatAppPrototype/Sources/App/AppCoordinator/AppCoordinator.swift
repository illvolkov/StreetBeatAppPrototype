//
//  AppCoordinator.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 02.09.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showTabBar()
    }
    
    private func showTabBar() {
        let tabBarCoordinator = TabBarCoordinator(window: window)
        tabBarCoordinator.start()
    }
}
