//
//  Router.swift
//  VIPER
//
//  Created by Bruno Oliveira on 05/05/24.
//

import Foundation
import UIKit

typealias UserDetailsRouterViews = UserDetailsViewController

protocol UserDetailsRouterProtocol {
    var entry: UserDetailsRouterViews? { get }
    func navigationPop()
}

class UserDetailsRouter: UserDetailsRouterProtocol {
    
    weak var view: UserDetailsViewController?

    init(view: UserDetailsViewController) {
        self.view = view
    }
    
    var entry: UserDetailsRouterViews?
    
    func navigationPop() {
        view?.navigationController?.popViewController(animated: true)
    }
    
}
