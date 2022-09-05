//
//  BasketCoordinator.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 05.09.2022.
//

import UIKit

class BasketCoordinator: Coordinator {
    
    //MARK: - Global properties

    weak var basketController: BasketController?
    weak var navigationController: UINavigationController?

    //MARK: - Initial

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.basketController = navigationController.topViewController as? BasketController
    }

    //MARK: - Functions

    func start() {
        basketController?.basketViewModel = BasketViewModel()
        basketController?.coordinator = self
    }
}
