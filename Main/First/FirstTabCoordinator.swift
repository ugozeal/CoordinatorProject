//
//  FirstTabCoordinator.swift
//  CoordinatorProject
//
//  Created by David Okonkwo on 06/03/2023.
//

import UIKit
import SwiftUI

final class FirstTabCoordinator: NSObject, Coordinator {
    var rootViewController: UINavigationController
    let viewModel = FirstTabViewModel()
    
    override init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        super.init()
        rootViewController.delegate = self
    }
    
    lazy var firstViewController: UIViewController = {
        let vc = FirstViewController()
        vc.viewModel = viewModel
        vc.showDetailRequested = { [weak self] in
            self?.goToDetails()
        }
        vc.title = "First"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([firstViewController], animated: false)
    }
    
    func goToDetails() {
        let detailViewController = UIHostingController(rootView: FirstDetailView(viewModel: viewModel))
        rootViewController.pushViewController(detailViewController, animated: true)
    }
}

extension FirstTabCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
    }
}
