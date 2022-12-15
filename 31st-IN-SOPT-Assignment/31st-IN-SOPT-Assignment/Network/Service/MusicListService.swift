//
//  MusicListService.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/19.
//

import Foundation

import Moya

enum MusicListService {
    case musicList
}

extension MusicListService: BaseTargetType {    
    var path: String {
        switch self {
        case .musicList:
            return URLConstant.musicListURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .musicList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .musicList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .musicList:
            return NetworkConstant.noTokenHeader
        }
    }
}
