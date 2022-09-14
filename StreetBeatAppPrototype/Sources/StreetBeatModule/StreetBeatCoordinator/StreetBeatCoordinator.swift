//
//  StreetBeatCoordinator.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 04.09.2022.
//

import UIKit

class StreetBeatCoordinator: Coordinator {
    
    //MARK: - Global properties

    weak var streetBeatController: StreetBeatController?
    weak var navigationController: UINavigationController?

    //MARK: - Initial

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.streetBeatController = navigationController.topViewController as? StreetBeatController
    }

    //MARK: - Functions

    func start() {
        streetBeatController?.streetBeatViewModel = StreetBeatViewModel()
        streetBeatController?.coordinator = self
    }
}
