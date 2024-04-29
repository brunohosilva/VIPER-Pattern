//
//  Router.swift
//  VIPER
//
//  Created by Bruno Oliveira on 28/04/24.
//

import Foundation
import UIKit

// Object
// entry point

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
}

class UserRouter: AnyRouter {
    
    var entry: EntryPoint?
    
}
