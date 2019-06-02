//
//  ClipTableViewCell.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import UIKit

class ClipTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var clippedLabel: UILabel!
    @IBOutlet weak var clippedLikes: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var lenghtLabel: UILabel!
    @IBOutlet weak var entriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = UIColor.AppColors.backgroundBlack
    }

    func configureCell(video: Video) {
        statusLabel.text = video.status
        viewsLabel.text = "\(video.views) views"
        clippedLabel.text = "\(video.clippedUser) clipped \(video.clippedTime)h ago"
        clippedLikes.text = video.clipLikes
        videoImage.image = UIImage(named: video.thumbnail)
        rankLabel.text = video.rank
        prizeLabel.text = video.prize
        lenghtLabel.text = "\(video.lenght) "
        entriesLabel.text = "\(video.entries) Entries"
    }
    
}
