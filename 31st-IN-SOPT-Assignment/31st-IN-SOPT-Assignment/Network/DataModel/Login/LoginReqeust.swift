//
//  File.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/19.
//

import Foundation

struct LoginRequest: Codable {
    let emailOrContact: String
    let password: String
}
