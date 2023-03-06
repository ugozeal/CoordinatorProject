//
//  SecondTabCoordinator.swift
//  CoordinatorProject
//
//  Created by David Okonkwo on 06/03/2023.
//

import UIKit

final class SecondTabCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    
    lazy var secondViewController: UIViewController = {
        let vc = SecondViewController()
        vc.title = "Second"
        return vc
        
    }()
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
