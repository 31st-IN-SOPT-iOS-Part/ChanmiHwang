//
//  LoginViewController.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/07.
//

import UIKit

import SnapKit
import Then


final class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    private let startKakaoLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.textColor = .black
    }
    
    private let explanationLabel = UILabel().then {
        $0.text = """
                  사용하던 카카오계정이 있다면
                  이메일 또는 전화번호로 로그인해 주세요.
                  """
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 15, weight: .medium)
        $0.textColor = .gray
        $0.textAlignment = .center
    }
    
    private lazy var emailTextField = KakaoTextField().then {
        $0.placeholder = "이메일 또는 전화번호"
        $0.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingChanged)
    }
    
    private lazy var passwordTextField = KakaoTextField().then {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
        $0.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingChanged)
    }
    
    private lazy var loginButton = KakaoButton().then {
        $0.setTitle("카카오계정 로그인", for: .normal)
    }
    
    private lazy var createButton = KakaoButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
    }
    
    private let findEmailLabel = UILabel().then {
        $0.text = "카카오계정 또는 비밀번호 찾기"
        $0.font = .systemFont(ofSize: 15, weight: .medium)
        $0.textColor = .black
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    // MARK: - @objc
    
    @objc private func textFieldDidEndEditing() {
        if emailTextField.hasText && passwordTextField.hasText {
            loginButton.isEnabled = true
            print("wkfehlsi")
        } else {
            loginButton.isEnabled = false
        }
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
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
        }
        
        explanationLabel.snp.makeConstraints {
            $0.top.equalTo(startKakaoLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(explanationLabel.snp.bottom).offset(70)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        createButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        findEmailLabel.snp.makeConstraints {
            $0.top.equalTo(createButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
}
