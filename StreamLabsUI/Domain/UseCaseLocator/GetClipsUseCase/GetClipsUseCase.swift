//
//  GetClipsUseCase.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

protocol GetClipsUseCase {
    func execute(completion: @escaping ResponseClosure<[ClipItem]>)
}
