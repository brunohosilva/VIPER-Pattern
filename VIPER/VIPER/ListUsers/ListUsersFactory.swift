//
//  Factory.swift
//  VIPER
//
//  Created by Bruno Oliveira on 28/04/24.
//

import Foundation
import UIKit

protocol UsersViewControllerFactory {
    func userViewController() -> UIViewController
}

class UserModuleFactory: UsersViewControllerFactory {
    func userViewController() -> UIViewController {
        let view = UsersViewController()
        let router = UsersRouter(view: view)
        let interactor = UsersInteractor()
        let presenter = UsersPresenter(
            router: router,
            interactor: interactor,
            view: view
        )

        view.presenter = presenter
        presenter.viewDidLoad()
        
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
}
