//
//  CatalogCoordinator.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 03.09.2022.
//

import UIKit

class CatalogCoordinator: Coordinator {
    
    //MARK: - Global properties
    
    weak var catalogController: CatalogController?
    weak var navigationController: UINavigationController?
    
    //MARK: - Initial
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.catalogController = navigationController.topViewController as? CatalogController
    }
    
    //MARK: - Functions
    
    func start() {
        catalogController?.catalogViewModel = CatalogViewModel()
        catalogController?.coordinator = self
    }
}
