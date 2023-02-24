//
//  PokemonDetailsCoordinator.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 23/2/23.
//

import UIKit

class PokemonDetailsCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goBackToList() {
        navigationController.popViewController(animated: true)
    }
}
