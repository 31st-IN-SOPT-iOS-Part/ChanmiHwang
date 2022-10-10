//
//  AuthCompleteViewController.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/07.
//

import UIKit

final class AuthCompleteViewController: UIViewController {
    
    // MARK: - Property
    
    var name: String?
    
    // MARK: - UI Property
    
    private var authCompleteLabel = UILabel().then {
        $0.text = "님\n환영합니다"
        $0.numberOfLines = 0
        $0.addLineSpacing(spacing: 35)
        $0.font = .systemFont(ofSize: 20, weight: .medium)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    private lazy var checkButton = KakaoButton().then {
        $0.backgroundColor = .yellow
        $0.isUserInteractionEnabled = true
        $0.setTitle("확인", for: .normal)
        $0.addTarget(self, action: #selector(dismissMain), for: .touchUpInside)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setLayout()
    }
    
    // MARK: - @objc
    
    @objc private func dismissMain() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Custom Method
    
    func setData(string: String) {
        authCompleteLabel.text = string + "님\n 환영합니다"
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        setHierarchy()
        setConstraint()
    }
    
    private func setHierarchy() {
        view.addSubviews([authCompleteLabel, checkButton])
    }
    
    private func setConstraint() {
        authCompleteLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(200)
            $0.centerX.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints {
            $0.top.equalTo(authCompleteLabel.snp.bottom).offset(150)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50)
        }
    }

}
