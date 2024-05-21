//
//  Factory.swift
//  VIPER
//
//  Created by Bruno Oliveira on 05/05/24.
//

import Foundation

protocol UserDetailsViewControllerFactory {
    init()
    func createUserModule(
        userDetails: User
    ) -> UserDetailsViewController
}

class UserDetailsFactory: UserDetailsViewControllerFactory {
    required init() {}
    
    public func createUserModule(
        userDetails: User
    ) -> UserDetailsViewController {
        
        let view = UserDetailsViewController()
        let router = UserDetailsRouter(view: view)
        let interactor = UserDetailsInteractor()
        let presenter = UserDetailsPresenter(view: view, userDetails: userDetails)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.entry = view
        
        return view
    }
}
