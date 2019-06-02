//
//  UseCaseLocator.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

class UseCaseLocator: BaseUseCaseLocator {
    
    func getUseCase<T>(ofType type: T.Type) -> T? {
        switch String(describing: type) {
        case String(describing: GetClipsUseCase.self):
            return GetClipsUseCaseImp(provider: nil) as? T
        default:
            return nil
        }
    }
}
