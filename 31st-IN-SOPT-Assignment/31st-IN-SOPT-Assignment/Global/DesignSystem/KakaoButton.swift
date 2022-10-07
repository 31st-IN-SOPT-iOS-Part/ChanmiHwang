//
//  KakaoButton2.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/07.
//

import UIKit

final class KakaoButton: UIButton {
    
    // MARK: Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDefaultStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Default Style
    private func setDefaultStyle() {
        self.backgroundColor = .systemGray6
        self.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        self.layer.cornerRadius = 4
        self.isEnabled = false
        self.setTitleColor(.black, for: .normal)
    }
}


