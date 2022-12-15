//
//  LoginAPI.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/19.
//

import Foundation
import Moya

final class LoginAPI {
    static let shared: LoginAPI = LoginAPI()
    private let loginProvider = MoyaProvider<AuthService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var loginResponse: GeneralResponse<LoginResponse>?
    public private(set) var loginRequest: LoginRequest?
    
    // MARK: - Signup
    
    func login(param: LoginRequest, completion: @escaping ((LoginResponse?, Error?) -> ())) {
        loginProvider.request(.login(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.loginResponse = try result.map(GeneralResponse<LoginResponse>.self)
                    guard let logindata = self?.loginResponse?.data else {
                        completion(nil, Error.self as? Error)
                        return
                    }
                    completion(logindata, nil)
                } catch(let err) {
                    print(err.localizedDescription)
                    completion(nil, err)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil, err)
            }
        }
    }
}
