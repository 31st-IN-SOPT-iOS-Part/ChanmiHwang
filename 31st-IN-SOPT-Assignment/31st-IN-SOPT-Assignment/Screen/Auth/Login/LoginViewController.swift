//
//  LoginViewController.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/07.
//

import UIKit

import RxCocoa
import RxSwift
import RxRelay
import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    private var viewModel = LoginViewModel()
    private var disposeBag = DisposeBag()
    
    // MARK: - UI Property
    
    private let startKakaoLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 22, weight: .medium)
    }
    
    private let explanationLabel = UILabel().then {
        $0.text = """
                  사용하던 카카오계정이 있다면
                  이메일 또는 전화번호로 로그인해 주세요.
                  """
        $0.numberOfLines = 0
        $0.textColor = .gray
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    private lazy var emailTextField = KakaoTextField().then {
        $0.placeholder = "이메일 또는 전화번호"
//         $0.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingChanged)
    }
    
    private lazy var passwordTextField = KakaoTextField().then {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
//         $0.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingChanged)
    }
    
    private lazy var loginButton = KakaoButton().then {
        $0.setTitle("카카오계정 로그인", for: .normal)
        $0.addTarget(self, action: #selector(presentAuthComplete), for: .touchUpInside)
    }
    
    private lazy var createButton = KakaoButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.isUserInteractionEnabled = true
//        $0.addTarget(self, action: #selector(pushSignUpVC), for: .touchUpInside)
    }
    
    private let findEmailLabel = UILabel().then {
        $0.text = "카카오계정 또는 비밀번호 찾기"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 13, weight: .medium)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetTextField()
    }
    
    // MARK: - @objc
    
//    @objc private func pushSignUpVC() {
//        let signUpVC = SignUpViewController()
//        self.navigationController?.pushViewController(signUpVC, animated: true)
//    }
    
    @objc private func presentAuthComplete() {
        let authCompleteVC = AuthCompleteViewController()
        authCompleteVC.modalPresentationStyle = .fullScreen
        
        authCompleteVC.setData(string: emailTextField.text ?? "")
        self.present(authCompleteVC, animated: true)
    }
    
//    @objc private func textFieldDidEndEditing() {
//        if emailTextField.hasText && passwordTextField.hasText {
//            loginButton.isUserInteractionEnabled = true
//        } else {
//            loginButton.isUserInteractionEnabled = false
//        }
//    }
    
    // MARK: - Bind UI
    
    private func bindUI() {
        // Input 2 - ID, password textField 입력
        
        let input = LoginViewModel.Input(
            emailDidEdit: emailTextField.rx.text.orEmpty.asObservable(),
            passwordDidEdit: passwordTextField.rx.text.orEmpty.asObservable(),
            loginTap: loginButton.rx.tap.asObservable(),
            signUpTap: createButton.rx.tap.asObservable()
        )
        
        let output = viewModel.transform(from: input)
        
        output.enableLogin
            .bind(to: loginButton.rx.isUserInteractionEnabled)
            .disposed(by: disposeBag)
        
        output.goToSignUp
            .bind(onNext: { result in
                let signUpVC = SignUpViewController()
                self.navigationController?.pushViewController(signUpVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        // output 1 - 버튼의 enable 활성화
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func resetTextField() {
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func setLayout() {
        setHierarchy()
        setConstraint()
    }
    
    private func setHierarchy() {
        view.addSubviews([startKakaoLabel, explanationLabel, emailTextField,
                          passwordTextField, loginButton, createButton, findEmailLabel])
    }
    
    private func setConstraint() {
        startKakaoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.centerX.equalToSuperview()
        }
        
        explanationLabel.snp.makeConstraints {
            $0.top.equalTo(startKakaoLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.top.equalTo(explanationLabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(49)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.height.equalTo(49)
        }
        
        loginButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.height.equalTo(44)
        }
        
        createButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
            $0.height.equalTo(44)
        }
        
        findEmailLabel.snp.makeConstraints {
            $0.top.equalTo(createButton.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
    }
}
