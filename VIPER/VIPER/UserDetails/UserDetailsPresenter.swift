//
//  Presenter.swift
//  VIPER
//
//  Created by Bruno Oliveira on 05/05/24.
//

import Foundation

// object
// protocol
// ref to interactor, router, view

protocol UserDetailsPresenterProtocol {
    var router: UserDetailsRouter? { get set }
    var interactor: UserDetailsInteractor? { get set }
    var view: UserDetailsViewController? { get set }
    
    func createUserDetails(userDetails: User)
    func navigationPop()
}

class UserDetailsPresenter: UserDetailsPresenterProtocol {
    
    var view: UserDetailsViewController?
    var userDetails: User
    
    init(view: UserDetailsViewController,
         userDetails: User) {
        self.view = view
        self.userDetails = userDetails
    }
    
    func createUserDetails(userDetails: User) {
        view?.userDetails(userDetails: userDetails)
    }
    
    func navigationPop() {
        router?.navigationPop()
    }
    
    var router: UserDetailsRouter?
    
    var interactor: UserDetailsInteractor?
    
}
