//
//  KakaoButton2.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/07.
//

import UIKit

final class KakaoButton: UIButton {
    
    // MARK: initialiaztion
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDefaultStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDefaultStyle() {
        self.backgroundColor = .systemGray6
        self.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        self.layer.cornerRadius = 4
        self.isUserInteractionEnabled = false
        self.setTitleColor(.black, for: .normal)
    }
}


