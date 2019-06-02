//
//  NetworkProvider.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation
import Moya

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

typealias APICustomClosure = (StreamAPI) -> Endpoint


class NetworkProvider: Network {
    
    var provider: MoyaProvider<StreamAPI>
    
    required init(customClosure: APICustomClosure? = nil) {
        if customClosure == nil {
            provider = MoyaProvider<StreamAPI> (plugins: [NetworkLoggerPlugin(verbose: true)])
            return
        }
        provider = MoyaProvider<StreamAPI>(endpointClosure: customClosure!, stubClosure: MoyaProvider.immediatelyStub)
    }
    
    func getClips(completion: @escaping ResponseClosure<[ClipItem]>) {
        provider.request(.getClips()) { (result) in
            switch result {
            case .success(let jsonData):
                let jsonDecoder = JSONDecoder()
                do {
                    let list: ClipList = try jsonDecoder.decode(ClipList.self, from: jsonData.data)
                    completion(.success(list.highlights))
                }
                catch {
                    completion(.failure(AppError(message: error.localizedDescription)))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
