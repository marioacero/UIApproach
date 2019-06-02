//
//  GetClipsUseCaseImp.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

class GetClipsUseCaseImp: UseCase, GetClipsUseCase {
    
    var networkProvider: NetworkProvider
    
    init(provider: NetworkProvider?) {
        guard let netProvider: NetworkProvider = provider else {
            let customClosure = ProviderCustomClosure.apiCustomClosure(statusCode: 200, isSuccess: true)
            self.networkProvider = NetworkProvider(customClosure: customClosure)
            return
        }
        self.networkProvider = netProvider
    }
    
    func execute(completion: @escaping ResponseClosure<[ClipItem]>) {
        networkProvider.getClips { (response) in
            completion(response)
        }
    }
}
