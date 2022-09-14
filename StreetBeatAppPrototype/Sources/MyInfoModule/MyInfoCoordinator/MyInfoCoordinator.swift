//
//  MyInfoCoordinator.swift
//  StreetBeatAppPrototype
//
//  Created by Ilya Volkov on 05.09.2022.
//

import UIKit

class MyInfoCoordinator: Coordinator {
    
    //MARK: - Global properties

    weak var myInfoController: MyInfoController?
    weak var navigationController: UINavigationController?

    //MARK: - Initial

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.myInfoController = navigationController.topViewController as? MyInfoController
    }

    //MARK: - Functions

    func start() {
        myInfoController?.myInfoViewModel = MyInfoViewModel()
        myInfoController?.coordinator = self
    }
}
