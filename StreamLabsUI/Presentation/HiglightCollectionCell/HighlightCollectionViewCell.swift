//
//  HighlightCollectionViewCell.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import UIKit

class HighlightCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var gradiantView: GradiantView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        badgeLabel.layer.cornerRadius = badgeLabel.frame.height / 2
        badgeLabel.clipsToBounds = true
    }
    
    func configureCell(clip: ClipItem) {
        avatarButton.layer.cornerRadius = avatarButton.frame.height / 2
        avatarButton.setBackgroundImage(UIImage.init(named: clip.avatar), for: .normal)
        avatarButton.clipsToBounds = true
        nicknameLabel.text = clip.nickName
        
        gradiantView.isHidden = true
        if let badge = clip.badge {
            badgeLabel.text = String(badge)
            gradiantView.isHidden = false
        }
        
    }
}
