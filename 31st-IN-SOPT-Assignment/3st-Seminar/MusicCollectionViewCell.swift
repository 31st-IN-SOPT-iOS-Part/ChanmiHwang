//
//  MusicCollectionViewCell.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/19.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

// MARK: - MusicCollectionViewCell

final class MusicCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "MusicCollectionViewCell"
    
    // MARK: - UI Components
    
    private let albumContainerView = UIView()
    private let albumImageView = UIImageView()
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private let singerLabel = UILabel().then {
        $0.textColor = 0x1E1E1E.color
        $0.font = .systemFont(ofSize: 15, weight: .medium)
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MusicCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [albumContainerView, titleLabel, singerLabel].forEach {
            contentView.addSubview($0)
        }
        
        albumContainerView.addSubview(albumImageView)
        albumContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(9)
            $0.height.equalTo(139)
        }
        
        albumImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(albumContainerView.snp.bottom).offset(6)
            $0.leading.equalTo(albumContainerView).offset(4)
            $0.trailing.equalToSuperview().offset(-9)
        }
        
        singerLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: MusicModel) {
        titleLabel.text = model.title
        singerLabel.text = model.singer
        albumImageView.image = UIImage(named: model.albumImage)
    }
}
