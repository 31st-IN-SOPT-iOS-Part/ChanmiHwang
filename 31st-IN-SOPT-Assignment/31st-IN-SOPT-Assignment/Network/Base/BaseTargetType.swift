//
//  BaseTargetType.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/18.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
}
