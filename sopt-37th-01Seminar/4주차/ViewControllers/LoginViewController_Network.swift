//
//  LoginViewController_Network.swift
//  sopt-37th-01Seminar
//
//  Created by 이승준 on 11/10/25.
//

import UIKit
import SnapKit

final class LoginViewController_Network: BaseViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "4차 세미나"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username (예: johndoe)"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.text = "Rudy"  // 테스트용 기본값
        textField.addPadding()
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password (예: P@ssw0rd!)"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.text = "Aa1234!@"  // 테스트용 기본값
        textField.addPadding()
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름 (예: 홍길동)"
        textField.borderStyle = .roundedRect
        textField.text = "이승준"  // 테스트용 기본값
        textField.addPadding()
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email (예: hong@example.com)"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.text = "test@naver.com"  // 테스트용 기본값
        textField.addPadding()
        return textField
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "나이 (예: 25)"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.text = "27"  // 테스트용 기본값
        textField.addPadding()
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원가입 (POST /api/v1/users)", for: .normal)
        button.backgroundColor = .systemBlue // 여러분 에러
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인 (POST /api/v1/auth/login)", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var updateUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원정보 수정 (PATCH /api/v1/auth/users/\(userId ?? -1)", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(updateUserTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var deleteUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원탈퇴 (DELETE /api/v1/auth/users/\(userId ?? -1)", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(deleteUserTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var getUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원정보 조회 (GET /api/v1/auth/users/\(userId ?? -1)", for: .normal)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(getUserTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Properties
    
    private let provider: NetworkProviding
    
    private var userId: Int = 117
    
    // MARK: - Init
    
    init(provider: NetworkProviding = NetworkProvider()) {
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
        Task {
            await performGetUser(userId: self.userId)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
    }
    
    // MARK: - UI & Layout
    
    private func setHierarchy() {
        view.addSubviews(
            titleLabel,
            usernameTextField,
            passwordTextField,
            nameTextField,
            emailTextField,
            ageTextField,
            registerButton,
            loginButton,
            updateUserButton,
            deleteUserButton,
            getUserButton,
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(registerButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        updateUserButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        deleteUserButton.snp.makeConstraints {
            $0.top.equalTo(updateUserButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        getUserButton.snp.makeConstraints {
            $0.top.equalTo(deleteUserButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
    }
    
    // MARK: - Actions
    
    @objc private func deleteUserTapped() {
        
        Task {
            await performDeleteUser(userId: userId)
        }
    }
    
    @objc private func getUserTapped() {
        Task {
            await performGetUser(userId: userId)
        }
    }
    
    @objc private func registerButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let ageText = ageTextField.text, let age = Int(ageText) else {
            showAlert(title: "입력 오류", message: "모든 필드를 올바르게 입력해주세요.")
            return
        }
        
        // Swift Concurrency를 사용한 네트워크 요청!
        Task {
            await performRegister(
                username: username,
                password: password,
                name: name,
                email: email,
                age: age
            )
        }
    }
    
    @objc private func loginButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "입력 오류", message: "아이디와 비밀번호를 입력해주세요.")
            return
        }
        
        // Swift Concurrency를 사용한 네트워크 요청!
        Task {
            await performLogin(username: username, password: password)
        }
    }
    
    @objc private func updateUserTapped() {
        
        Task {
            await performUpdateUser(userId: userId)
        }
    }
    
    // MARK: - Network Methods (Swift Concurrency!)
    
    @MainActor
    private func performDeleteUser(userId: Int) async {
        loadingIndicator.startAnimating()
        
        do {
            let _ = try await UserAPI.performDeleteUser(id: self.userId)
            titleLabel.text = "회원탈퇴 완료"
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Delete Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "회원탈퇴 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Delete Unknown Error] \(error)")
            showAlert(title: "회원탈퇴 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
    
    @MainActor
    private func performGetUser(userId: Int) async {
        loadingIndicator.startAnimating()
        
        do {
            let response = try await UserAPI.performGetUser(id: self.userId)
            
            nameTextField.text = response.name
            emailTextField.text = response.email
            ageTextField.text = String(response.age)
            self.userId = response.id
            switch response.status {
            case "ACTIVATE":
                titleLabel.text = "회원 정보 조회 완료"
            case "INACTIVATE":
                titleLabel.text = "비활성화된 계정입니다.\n회원가입 해주세요."
            default:
                return
            }
            
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Get Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "회원정보 조회 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Get Unknown Error] \(error)")
            showAlert(title: "회원정보 조회 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
    
    /// 회원가입 API 호출
    @MainActor
    private func performRegister(
        username: String,
        password: String,
        name: String,
        email: String,
        age: Int
    ) async {
        loadingIndicator.startAnimating()
        
        do {
            // UserAPI의 convenience method 사용
            let response = try await UserAPI.performRegister(
                username: username,
                password: password,
                name: name,
                email: email,
                age: age,
                provider: provider
            )
            
            // 성공 시 Welcome 화면으로 이동
            titleLabel.text = response.username + "회원가입 성공"
//            showAlert(title: "회원가입 성공", message: "회원가입이 완료되었습니다!") { [weak self] in
//                self?.navigateToWelcome(userId: response.id, userName: response.name)
//            }
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Register Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "회원가입 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Register Unknown Error] \(error)")
            showAlert(title: "회원가입 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
    
    /// 로그인 API 호출
    @MainActor
    private func performLogin(username: String, password: String) async {
        loadingIndicator.startAnimating()
        
        do {
            // UserAPI의 convenience method 사용
            let response = try await UserAPI.performLogin(
                username: username,
                password: password,
                provider: provider
            )
            
            // 성공 시
            // User Id 저장
            self.userId = response.userId
            print(response)
            titleLabel.text = "로그인 성공"
            // Welcome 화면으로 이동
//            showAlert(title: "로그인 성공", message: response.message) { [weak self] in
//                self?.navigateToWelcome(userId: response.userId, userName: username)
//            }
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Login Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Login Unknown Error] \(error)")
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
    
    /// 회원 정보 수정 API 호출
    @MainActor
    private func performUpdateUser(userId: Int,) async {
        loadingIndicator.startAnimating()
        
        do {
            // UserAPI의 convenience method 사용
            let response = try await UserAPI.update(userId, UpdateUserRequest(name: usernameTextField.text, email: emailTextField.text, age: Int(ageTextField.text ?? "0") ?? 0))
            // 성공 시
            titleLabel.text = "회원 정보 수정 성공"
            // showAlert(title: "회원 정보 수정 성공", message: "")
            
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Update User Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Update User Unknown Error] \(error)")
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
    
    // MARK: - Navigation
    
    private func navigateToWelcome(userId: Int, userName: String) {
        let welcomeVC = WelcomeViewController_Network()
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

#Preview {
    LoginViewController_Network()
}

