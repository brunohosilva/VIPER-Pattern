//
//  Presenter.swift
//  VIPER
//
//  Created by Bruno Oliveira on 28/04/24.
//

import Foundation
import UIKit

// object
// protocol
// ref to interactor, router, view

enum FetchError: Error {
    case failed
}

protocol UsersPresenterProtocol {
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    func userSelected(userDetails: User)
}

class UsersPresenter: UsersPresenterProtocol {
    var router: UsersRouter?
    var interactor: UsersInteractor?
    var view: UsersViewController?

    init(router: UsersRouter,
         interactor: UsersInteractor,
         view: UsersViewController){
        self.router = router
        self.interactor = interactor
        self.view = view
        self.interactor?.presenter = self
    }
    
    func viewDidLoad() {
        interactor?.getUsers()
    }

    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "algo deu errado!")
        }
    }

    func userSelected(userDetails: User) {
        router?.navigateToUserDetails(userDetails: userDetails)
    }
}
