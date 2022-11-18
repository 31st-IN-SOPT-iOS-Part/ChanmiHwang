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
    var message: String
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
