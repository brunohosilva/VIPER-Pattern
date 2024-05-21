//
//  Interactor.swift
//  VIPER
//
//  Created by Bruno Oliveira on 05/05/24.
//

import Foundation

protocol UserDetailsInteractorProtocol {
    var presenter: UserDetailsPresenter? { get set }
}

class UserDetailsInteractor: UserDetailsInteractorProtocol {
    var presenter: UserDetailsPresenter?
}
