//
//  MockLocator.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

class MockLocator: NSObject {
    
    private static var instance: MockLocator?
    
    static var shared: MockLocator {
        if instance == nil {
            instance = MockLocator()
        }
        return instance!
    }
    
    private override init() {}
    
    func getMockData(action: StreamAPI)-> String {
        var fileName: String!
        let txtFile = "json"
        
        switch action {
        case .getClips:
            fileName = "clips_response"
        }
        
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: fileName, ofType: txtFile)!
        return try! String(contentsOfFile: path)
    }
}
