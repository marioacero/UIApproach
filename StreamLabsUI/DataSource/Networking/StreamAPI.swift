//
//  StreamAPI.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum StreamAPI {
    case getClips()
}

extension StreamAPI: TargetType {
    
    var baseURL: URL {
        guard let url: URL = URL(string: AppConstants.baseUrl) else{
            fatalError(AppConstants.Errors.baseUrl)
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getClips:
            return "clips"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var sampleData: Data {
        return MockLocator.shared.getMockData(action: self).data(using: String.Encoding.utf8)!
    }
    
    var failureData: Data {
        return "{failure data}".data(using: String.Encoding.utf8)!
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
