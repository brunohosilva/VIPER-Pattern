//
//  Factory.swift
//  VIPER
//
//  Created by Bruno Oliveira on 28/04/24.
//

import Foundation

// Factory Protocol
protocol VIPERModuleFactory {
    func createUserModule() -> AnyView
}

// Factory Implementation
class UserModuleFactory: VIPERModuleFactory {
    func createUserModule() -> AnyView {
        
        let router = UserRouter()
        let interactor = UserInteractor()
        let presenter = UserPresenter()
        let view = UserViewController()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.entry = view
        
        return view
    }
}
