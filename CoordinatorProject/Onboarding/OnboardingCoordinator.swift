//
//  OnboardingCoordinator.swift
//  CoordinatorProject
//
//  Created by David Okonkwo on 06/03/2023.
//

import Combine
import SwiftUI
import UIKit

final class OnboardingCoordinator: Coordinator {
    var rootViewController = UIViewController()
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: view)
    }
}

