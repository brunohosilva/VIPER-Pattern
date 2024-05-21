//
//  Router.swift
//  VIPER
//
//  Created by Bruno Oliveira on 28/04/24.
//

import Foundation
import UIKit

protocol UsersRouterProtocol: AnyObject {
    func navigateToUserDetails(userDetails: User)
}

class UsersRouter: UsersRouterProtocol {
    weak var view: UsersViewController?

    init(view: UsersViewController) {
        self.view = view
    }

    func navigateToUserDetails(userDetails: User) {
        let userDetailsViewController = UserDetailsFactory().createUserModule(userDetails: userDetails)
        view?.navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
}

