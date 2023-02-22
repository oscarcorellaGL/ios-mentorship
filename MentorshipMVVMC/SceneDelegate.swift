//
//  SceneDelegate.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 15/2/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navController = UINavigationController()
        let coordinator = MainCoordinator(navigationController: navController)
        window = UIWindow(windowScene: windowScene)
        //TODO: Kotlin Apply equivalent here?
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        coordinator.start()
    }


}

