//
//  GeneralResponse.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/18.
//

import Foundation

struct GeneralResponse<T: Decodable>: Decodable {
    var statusCode: Int
    var success: Bool
    var message: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case message
        case data
        case statusCode
        case success
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
        statusCode = (try? values.decode(Int.self, forKey: .statusCode)) ?? 0
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
    }
}

struct GeneralArrayResponse<T: Decodable>: Decodable {
    let statusCode: Int
    let message: String
    let success: Bool
    let data: [T]?
    
    enum CodingKeys: String, CodingKey {
        case message
        case data
        case statusCode
        case success
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([T].self, forKey: .data)) ?? []
        statusCode = (try? values.decode(Int.self, forKey: .statusCode)) ?? 0
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
    }
}

/// status, message, success 이외에 정보를 사용하지 않는 경우에 VoidType를 설정해주면 됩니다!
struct VoidType: Decodable {}
