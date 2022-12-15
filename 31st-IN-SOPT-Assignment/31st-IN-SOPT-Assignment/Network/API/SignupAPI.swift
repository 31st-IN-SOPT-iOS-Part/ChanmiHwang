//
//  SignupAPI.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/18.
//

import Foundation
import Moya

final class SignupAPI {
    static let shared: SignupAPI = SignupAPI()
    private let signupProvider = MoyaProvider<AuthService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var signupResponse: GeneralResponse<SignupResponse>?
    public private(set) var signUpData: SignupResponse?
    
    // MARK: - Signup
    
    func signup(param: SignupRequest, completion: @escaping ((SignupResponse?, Error?) -> ())) {
        signupProvider.request(.signup(param: param)) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.signupResponse = try result.map(GeneralResponse<SignupResponse>.self)
                    guard let signupData = self?.signupResponse?.data else {
                        completion(nil, Error.self as? Error)
                        return
                    }
                    completion(signupData, nil)
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
