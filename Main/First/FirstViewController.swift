//
//  FirstViewController.swift
//  CoordinatorProject
//
//  Created by David Okonkwo on 06/03/2023.
//

import Combine
import UIKit

class FirstViewController: UIViewController {
    var infoLabel: UILabel?
    var viewModel: FirstTabViewModel!
    var showDetailRequested: () -> () = { }
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupInfoLabel()
        setupDetailButton()
    }
    
    func setupInfoLabel () {
        let infoLable = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 60))
        self.view.addSubview(infoLable)
        self.infoLabel = infoLable
        
        viewModel.$email
            .combineLatest(viewModel.$name)
            .sink { [weak self] (email, name) in
                if email.count + name.count > 0 {
                    self?.infoLabel?.text = "\(name) with email \(email)"
                } else {
                    self?.infoLabel?.text = ""
                }
            }
            .store(in: &cancellables)
    }
    
    func setupDetailButton () {
        let button = UIButton (frame: CGRect(x: 100,
                                             y: 500, width: 200, height: 60))
        button.setTitleColor(.systemBlue,
                             for: .normal)
        button.setTitle ("Go to detail", for: .normal)
        button.addTarget(self,
                         action: #selector (buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }

    @objc func buttonAction() {
        showDetailRequested()
    }
}
