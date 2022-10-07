//
//  SignUpViewController.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/07.
//

import UIKit

import SnapKit
import Then
import SwiftUI

final class SignUpViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let startKakaoLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.textColor = .black
    }
    
    private lazy var emailTextField = KakaoTextField().then {
        $0.placeholder = "이메일 또는 전화번호"
    }
    
    private lazy var passwordTextField = KakaoTextField().then {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
        $0.addTarget(self, action: #selector(textFieldDidCheckPassword), for: .editingChanged)
    }
    
    private lazy var checkpasswordTextField = KakaoTextField().then {
        $0.placeholder = "비밀번호 확인"
        $0.addTarget(self, action: #selector(textFieldDidCheckPassword), for: .editingChanged)
        $0.isSecureTextEntry = true
    }
    
    private lazy var createButton = KakaoButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.addTarget(self, action: #selector(presentAuthCompleteVC), for: .touchUpInside)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
    
    // MARK: - @objc
    
    @objc private func textFieldDidCheckPassword() {
        if passwordTextField.text == checkpasswordTextField.text {
            createButton.isEnabled = true
        } else {
            createButton.isEnabled = false
        }
    }
    
    @objc private func presentAuthCompleteVC() {
        let authComplete = AuthCompleteViewController()
        authComplete.modalPresentationStyle = .fullScreen
        
        present(authComplete, animated: true, completion: nil)
    }
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        setHierarchy()
        setConstraint()
    }
    
    private func setHierarchy() {
        view.addSubviews([startKakaoLabel, emailTextField, passwordTextField,
                          checkpasswordTextField, createButton])
    }
    
    private func setConstraint() {
        startKakaoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(startKakaoLabel.snp.bottom).offset(125)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        checkpasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
        
        createButton.snp.makeConstraints {
            $0.top.equalTo(checkpasswordTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
    }
}

    
    // MARK: - @objc
    
    // MARK: - Custom Method

