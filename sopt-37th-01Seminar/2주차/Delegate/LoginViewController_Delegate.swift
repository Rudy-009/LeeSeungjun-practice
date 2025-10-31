//
//  AppGguViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 이승준 on 10/11/25.
//

import UIKit
import SnapKit

final class LoginViewController_Delegate: UIViewController, WelcomeReloginDelegate {
    
    // MARK: - Properties
    let danggeunOrange = UIColor.danggeunTheme
    // 텍스트 필드 배경색 (약간 연한 회색)
    let textFieldBackgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    // 텍스트 필드 테두리 색상 (더 연한 회색)
    let textFieldBorderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
    
    // MARK: - UI Components
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: 163, width: self.view.bounds.width - 139, height: 50))
        label.text = "동네라서 가능한 모든 것\n 당근에서 가까운 이웃과 함께해요."
        label.textColor = .text
        label.font = UIFont(name: "Pretendard-Bold", size: 20) // UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: self.view.bounds.width - 40, height: 52))
        textField.placeholder = "아이디"
        textField.borderStyle = .none // 기본 borderStyle 제거
        textField.backgroundColor = .subBackground
        textField.layer.cornerRadius = 3
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor // 더 연한 테두리
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        // 텍스트 필드 좌우 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        textField.rightViewMode = .always
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: self.view.bounds.width - 40, height: 45))
        textField.placeholder = "비밀번호"
        textField.borderStyle = .none // 기본 borderStyle 제거
        textField.isSecureTextEntry = true
        textField.backgroundColor = .subBackground
        textField.layer.cornerRadius = 3
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor // 더 연한 테두리
        textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        // 텍스트 필드 좌우 패딩 추가
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: textField.frame.height))
        textField.rightViewMode = .always
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 442, width: self.view.bounds.width - 40, height: 57))
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = danggeunOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setHierarchy()
        setLayout()
    }
    
    // MARK: - UI & Layout
    
    private func setUI() {
        view.backgroundColor = .background
    }
    
    private func setHierarchy() {
        let components = [
            titleLabel,
            emailTextField,
            passwordTextField,
            loginButton,
        ]
        
        components.forEach { view.addSubview($0) }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 422),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 57),
        ])
    }
    
    @objc
    private func loginButtonDidTap() {
        // presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Delegate()
        welcomeViewController.id = emailTextField.text ?? nil
        welcomeViewController.delegate = self // (5)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Delegate()
        welcomeViewController.name = emailTextField.text ?? nil
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
    }
    
    public func retryLogin(_ viewController: UIViewController, didTapReloginWith message: String) {
        titleLabel.text = message
        emailTextField.text = ""
        passwordTextField.text = ""
        loginButton.setTitle("다시 로그인하기", for: .normal)
    }
}

#Preview {
    UINavigationController(rootViewController: LoginViewController_Delegate())
}
