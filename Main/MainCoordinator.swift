//
//  MainCoordinator.swift
//  CoordinatorProject
//
//  Created by David Okonkwo on 06/03/2023.
//

import UIKit

final class MainCoordinator: Coordinator {
    var rootViewController: UITabBarController
    var childCoordinators = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .lightGray
    }
    
    func start() {
        let firstCoordinator = FirstTabCoordinator()
        firstCoordinator.start()
        self.childCoordinators.append(firstCoordinator)
        let firstViewController = firstCoordinator.rootViewController
        firstViewController.tabBarItem = UITabBarItem(
            title: "First",
            image: UIImage(systemName: "paperclip"),
            selectedImage: UIImage(systemName: "paperclip.fill"))
        
        let secondCoordinator = SecondTabCoordinator()
        secondCoordinator.start()
        self.childCoordinators.append(secondCoordinator)
        let secondViewController = secondCoordinator.rootViewController
        secondViewController.tabBarItem = UITabBarItem(
            title: "Second",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill"))
        
        self.rootViewController.viewControllers = [firstViewController, secondViewController]
    }
}
