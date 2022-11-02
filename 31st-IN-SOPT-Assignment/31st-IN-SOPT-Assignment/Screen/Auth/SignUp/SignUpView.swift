//
//  SignUpView.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/03.
//

import UIKit

import SnapKit
import Then

final class SignUpView: UIView {
    
    // MARK: - UI Property
    
    private let startKakaoLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 22, weight: .medium)
    }
    
    let emailTextField = KakaoTextField().then {
        $0.placeholder = "이메일 또는 전화번호"
    }
    
    let passwordTextField = KakaoTextField().then {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    
    let checkpasswordTextField = KakaoTextField().then {
        $0.placeholder = "비밀번호 확인"
        $0.isSecureTextEntry = true
    }
    
    let createButton = KakaoButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
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
        addSubviews([startKakaoLabel, emailTextField, passwordTextField,
                          checkpasswordTextField, createButton])
    }
    
    private func setConstraint() {
        startKakaoLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(40)
            $0.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.top.equalTo(startKakaoLabel.snp.bottom).offset(116)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(49)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.height.equalTo(49)
        }
        
        checkpasswordTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.height.equalTo(49)
        }
        
        createButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(21)
            $0.top.equalTo(checkpasswordTextField.snp.bottom).offset(26)
            $0.height.equalTo(44)
        }
    }
}
