//
//  GenericResponse.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

enum ResponseGeneric<T> {
    case success(_ response: T)
    case failure(_ error: AppError)
}

struct AppError: LocalizedError {
    
    enum AppErrorType: String {
        case networkConnectionError
        case serverError
        case cancelled
        case undefined
        
    }
    
    var errorType: AppErrorType?
    var message: String?
    
    init (errorType: AppErrorType?, message: String?) {
        self.errorType = errorType
        self.message = message
    }
    
    init (message: String?) {
        self.errorType = .undefined
        self.message = message
    }
}

typealias ResponseClosure<T> = (_ result: ResponseGeneric<T>) -> Void
