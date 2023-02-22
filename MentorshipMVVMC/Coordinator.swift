//
//  Coordinator.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 16/2/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func seeDetails()
}
