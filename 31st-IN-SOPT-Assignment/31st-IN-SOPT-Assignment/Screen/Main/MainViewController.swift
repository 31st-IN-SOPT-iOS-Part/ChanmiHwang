//
//  MainViewController.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/13.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    // MARK: - UI Property
    
    private let topView = UIView()
    
    private let kakaoMainLabel = UILabel().then {
        $0.text = "친구"
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
    }
    
    private let settingButton = UIButton().then {
        $0.setImage(Constant.Image.icSetting, for: .normal)
    }
    
    private lazy var profileButton = UIButton().then {
        $0.setImage(Constant.Image.profileImg, for: .normal)
        $0.addTarget(self, action: #selector(presentProfileDetailView), for: .touchUpInside)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgrountColor()
        setLayout()
    }
    
    // MARK: - @objc
    
    @objc private func presentProfileDetailView() {
        let profileDetailViewController = ProfileDetailViewController()
        profileDetailViewController.modalPresentationStyle = .fullScreen
        self.present(profileDetailViewController, animated: true)
    }
    
    // MARK: - Custom Method
    
    private func setBackgrountColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        setHierarchy()
        setConstraint()
    }
    
    private func setHierarchy() {
        view.addSubviews([topView, profileButton])
        topView.addSubviews([kakaoMainLabel, settingButton])
    }
    
    private func setConstraint() {
        topView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(52)
        }
        
        kakaoMainLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
        }
        
        settingButton.snp.makeConstraints {
            $0.leading.equalTo(kakaoMainLabel.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
        
        profileButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.top.equalTo(topView.snp.bottom).offset(15)
        }
    }
}
