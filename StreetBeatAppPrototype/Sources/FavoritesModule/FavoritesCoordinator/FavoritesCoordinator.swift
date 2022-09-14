//
//  FavoritesCoordinator.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class FavoritesCoordinator: Coordinator {
    //MARK: - Global properties

    weak var favoritesController: FavoritesController?
    weak var navigationController: UINavigationController?

    //MARK: - Initial

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.favoritesController = navigationController.topViewController as? FavoritesController
    }

    //MARK: - Functions

    func start() {
        favoritesController?.favoritesViewModel = FavoritesViewModel()
        favoritesController?.coordinator = self
    }
}
