//
//  LoginViewController_SnapKit.swift
//  sopt-37th-01Seminar
//
//  Created by 이승준 on 11/1/25.
//

import UIKit
import SnapKit

final class LoginViewController_SnapKit: UIViewController {
    
    private let rootView = LoginView()
        
    override func loadView() {
        self.view = rootView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        setAddTarget()
    }
    
    // MARK: - setup
    private func setAddTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_SnapKit()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = rootView.idTextField.text
        self.present(welcomeViewController, animated: true)
    }
        
    @objc
    private func loginButtonDidTap() {
        presentToWelcomeVC()
        // pushToWelcomeVC()
    }
        
    
}
