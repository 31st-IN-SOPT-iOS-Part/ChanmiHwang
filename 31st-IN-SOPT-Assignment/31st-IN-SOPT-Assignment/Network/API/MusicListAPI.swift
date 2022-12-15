//
//  MusicListAPI.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/12/15.
//

import Foundation
import Moya

final class MusicListAPI {
    static let shared: MusicListAPI = MusicListAPI()
    private let musicListProvider = MoyaProvider<MusicListService>(plugins: [MoyaLoggingPlugin()])
    private init() { }
    
    public private(set) var musicListData: GeneralArrayResponse<MusicListData>?
    
    func getMusicList(completion: @escaping ((GeneralArrayResponse<MusicListData>?) -> ())) {
        musicListProvider.request(.musicList) { [weak self] response in
            switch response {
            case .success(let result):
                do {
                    self?.musicListData = try result.map(GeneralArrayResponse<MusicListData>?.self)
                    guard let musicListData = self?.musicListData else { return }
                    completion(musicListData)
                } catch(let err) {
                    print(err.localizedDescription)
                    completion(nil)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completion(nil)
            }
        }
    }
}
