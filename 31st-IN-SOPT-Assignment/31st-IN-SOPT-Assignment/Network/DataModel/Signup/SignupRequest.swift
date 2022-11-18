//
//  SingupRequest.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/18.
//

import Foundation

struct SignupRequest: Codable {
    let emailOrContact: String
    let password: String
    let passwordCheck: String
}
