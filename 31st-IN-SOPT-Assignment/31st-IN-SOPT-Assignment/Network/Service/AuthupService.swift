//
//  SignupService.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/18.
//

import Foundation

import Moya

enum AuthService {
    case signup(param: SignupRequest)
    case login(param: LoginRequest)
}

extension AuthService: BaseTargetType {
    
    var path: String {
        switch self {
        case .signup:
            return URLConstant.signupURL
        case .login:
            return URLConstant.loginURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup, .login:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signup(let param):
        return .requestJSONEncodable(param)
        case .login(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .signup, .login:
            return NetworkConstant.noTokenHeader
        }
    }
}
