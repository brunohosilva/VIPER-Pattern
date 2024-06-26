//
//  Interactor.swift
//  VIPER
//
//  Created by Bruno Oliveira on 28/04/24.
//

import Foundation

// object
// protocol
// ref to presenter
// api calls

protocol UsersInteractorProtocol {
    var presenter: UsersPresenter? { get set }
    func getUsers()
}

class UsersInteractor: UsersInteractorProtocol {
    var presenter: UsersPresenter?
    
    func getUsers() {
        print("UserInteractor getUsers")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
            }
            catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }
        
        task.resume()
    }
}
