//
//  TabBarCoordinator.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 02.09.2022.
//

import UIKit

class TabBarCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarController = TabBarController()
        window.rootViewController = tabBarController
    }
}
