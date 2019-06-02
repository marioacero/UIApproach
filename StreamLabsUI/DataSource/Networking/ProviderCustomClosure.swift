//
//  ProviderCustomClosure.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation
import Moya

class ProviderCustomClosure: NSObject {
    
    static func apiCustomClosure(statusCode: Int, isSuccess: Bool)-> APICustomClosure {
        let customClosure = { (target: StreamAPI) -> Endpoint in
            var sampleData: Data = target.sampleData
            if !isSuccess {
                sampleData = target.failureData
            }
            
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(statusCode, sampleData ) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
        return customClosure
    }
}
