//
//  View.swift
//  VIPER
//
//  Created by Bruno Oliveira on 05/05/24.
//

import Foundation
import UIKit

protocol UserDetailsProtocol {
    var presenter: UserDetailsPresenter { get set }
    
    func userDetails(userDetails: User)
    
}

class UserDetailsViewController: UIViewController {
    
    var presenter: UserDetailsPresenter?
    
    let stackView = UIStackView()
    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        userDetails(userDetails: presenter?.userDetails)
        layout()
    }
}

extension UserDetailsViewController {
    
    func userDetails(userDetails: User?) {
        guard let userDetails else { return }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = userDetails.name
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonTapped() {
        presenter?.navigationPop()
    }
}
