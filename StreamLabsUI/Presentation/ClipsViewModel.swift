//
//  ClipsViewModel.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation

class ClipsViewModel {
    
    var useCaseLocator: UseCaseLocator
    var dataSource: [ClipItem] = []
    var currentVideo: Video!
    var starsAdded: Int = 0
    
    typealias VoidClosure = (()->())
    var reloadCollection: VoidClosure!
    
    init(caseLocator: UseCaseLocator? = nil ) {
        guard let locator: UseCaseLocator = caseLocator else {
            self.useCaseLocator = UseCaseLocator()
            return
        }
        self.useCaseLocator = locator
    }
    
    func getClips() {
        guard let useCase: GetClipsUseCase = useCaseLocator.getUseCase(ofType: GetClipsUseCase.self) else {
            return
        }
        
        useCase.execute { [weak self] (response) in
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(let clipsData):
                strongSelf.dataSource = clipsData
                strongSelf.currentVideo = clipsData.first!.video
                strongSelf.reloadCollection()
            default:
                break
            }
        }
    }
}
