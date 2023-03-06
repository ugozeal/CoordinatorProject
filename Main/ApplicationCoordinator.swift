//
//  ApplicationCoordinator.swift
//  CoordinatorProject
//
//  Created by David Okonkwo on 06/03/2023.
//

import Combine
import UIKit
import SwiftUI

final class ApplicationCoordinator: Coordinator {
    var window: UIWindow
    var childCoordinators = [Coordinator]()
    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    var cancellables = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        setupOnboardingValue()
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
            if hasSeen {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self?.childCoordinators = [mainCoordinator]
                self?.window.rootViewController = mainCoordinator.rootViewController
            } else if let hasSeenOnboarding = self?.hasSeenOnboarding {
                let onboardingCoordinator = OnboardingCoordinator(hasSeenOnboarding: hasSeenOnboarding)
                onboardingCoordinator.start()
                self?.childCoordinators = [onboardingCoordinator]
                self?.window.rootViewController = onboardingCoordinator.rootViewController
            }
        }
        .store(in: &cancellables)
    }
    
    func setupOnboardingValue () {
        // storing and loading of state/data
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) //default of false
        hasSeenOnboarding.send (value)
        hasSeenOnboarding
            .filter({ $0 })
            .sink { (value) in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &cancellables)
    }
}
