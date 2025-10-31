//
//  AppGguViewController.swift
//  sopt-37th-01Seminar
//
//  Created by 이승준 on 10/11/25.
//

import UIKit
import SnapKit

final class LoginViewController_Closure: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()

    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }

    private func setUI() {
        self.view.backgroundColor = .white
    }

    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
            // $0.translatesAutoresizingMaskIntoConstraints = false
            $0.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
            }
        }
        
//        NSLayoutConstraint.activate([
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 163)
//        ])
//        
//        NSLayoutConstraint.activate([
//            idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 71),
//            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            idTextField.heightAnchor.constraint(equalToConstant: 52),
//        ])
//        
//        NSLayoutConstraint.activate([
//            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 6),
//            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
//        ])
//        
//        NSLayoutConstraint.activate([
//            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
//            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            loginButton.heightAnchor.constraint(equalToConstant: 57),
//        ])
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(163)
            make.leading.trailing.equalToSuperview().inset(70)
            make.centerX.equalToSuperview().offset(163)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(71)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.idTextField.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(35)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(57)
        }
        
    }

    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.id = idTextField.text
        welcomeViewController.completionHandler = { [weak self] message in
            guard let self = self else { return }
            
            self.titleLabel.text = message
            self.idTextField.text = ""
            self.passwordTextField.text = ""
            loginButton.setTitle("다시 로그인하기", for: .normal)
        }
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_Closure()
        welcomeViewController.id = idTextField.text
        welcomeViewController.completionHandler = { [weak self] message in
            
            guard let self = self else { return }
            
            self.titleLabel.text = message
            self.idTextField.text = ""
            self.passwordTextField.text = ""
            loginButton.setTitle("다시 로그인하기", for: .normal)
        }
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }

    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
}

#Preview {
    UINavigationController(rootViewController: LoginViewController_Closure())
}
