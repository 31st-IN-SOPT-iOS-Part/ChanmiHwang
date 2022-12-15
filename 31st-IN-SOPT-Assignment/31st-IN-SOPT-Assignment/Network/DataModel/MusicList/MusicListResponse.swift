//
//  MusicModel.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/19.
//

import Foundation

struct MusicListResponse: Codable {
    let data: [MusicListData]
}

// MARK: - Datum
struct MusicListData: Codable {
    let id: Int
    let image: String
    let title, singer: String
}
