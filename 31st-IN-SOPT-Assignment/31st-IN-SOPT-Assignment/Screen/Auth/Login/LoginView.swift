//
//  LoginView.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/03.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView {
    
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
    
    private let findEmailLabel = UILabel().then {
        $0.text = "카카오계정 또는 비밀번호 찾기"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 13, weight: .medium)
    }
    
    let emailTextField = KakaoTextField().then {
        $0.placeholder = "이메일 또는 전화번호"
    }
    
    let passwordTextField = KakaoTextField().then {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    
    let loginButton = KakaoButton().then {
        $0.setTitle("카카오계정 로그인", for: .normal)
    }
    
    let createButton = KakaoButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.isUserInteractionEnabled = true
    }
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        setHierarchy()
        setConstraint()
    }
    
    private func setHierarchy() {
        addSubviews([startKakaoLabel, explanationLabel, emailTextField,
                          passwordTextField, loginButton, createButton, findEmailLabel])
    }
    
    private func setConstraint() {
        startKakaoLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(40)
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
