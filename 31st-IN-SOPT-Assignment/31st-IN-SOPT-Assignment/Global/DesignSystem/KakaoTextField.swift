//
//  KakaoTextField.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/07.
//

import UIKit

import Then
import SnapKit

final class KakaoTextField: UITextField {
    
    private var bottomView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
        setDefaultStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDefaultStyle() {
        self.textColor = .black
        self.font = .systemFont(ofSize: 14, weight: .medium)
        self.clearButtonMode = .whileEditing
    }
    
    private func setConstraints() {
        bottomView.snp.makeConstraints {
            $0.top.equalTo(self.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
