//
//  ClipsViewController.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//
import Foundation
import UIKit

class ClipsViewController: UIViewController {

    @IBOutlet weak var highlightsCollection: UICollectionView!
    @IBOutlet weak var clipTableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var avatarImage: UIButton!
    
    var viewModel: ClipsViewModel!
    var xAxis: CGFloat!
    
    let xNextPositionFrame: CGFloat = 30
    let colors: [UIColor] = [UIColor.AppColors.purpleGradient,
                             UIColor.AppColors.yellowGradient,
                             UIColor.AppColors.blue,
                             UIColor.AppColors.strawBerry,
                             UIColor.AppColors.green]
    
    struct Constants {
        static let paddingAnimationRight: CGFloat = 70
        static let yFinalAxis: CGFloat = -400
        static let clipCellHeight: CGFloat = 420
        static let commentsCellHeight: CGFloat = 40
        static let clipCellPosition: Int = 1
        static let sizeCellCollection: CGFloat = 90
        static let firstRow: Int = 0
        static let opacityPath: String = "opacity"
        static let positionPath: String = "position"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ClipsViewModel()
        setBinding()
        configureUI()
        configureCollection()
        configureTableView()
        viewModel.getClips()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func configureUI() {
        self.view.backgroundColor = UIColor.AppColors.backgroundBlack
        bottomView.layer.masksToBounds = false
        bottomView.layer.shadowColor = UIColor.AppColors.backgroundBlackShadow.cgColor
        bottomView.layer.shadowOpacity = 0.7
        bottomView.layer.shadowOffset = .zero
        bottomView.layer.shadowRadius = 30
        bottomView.layer.shouldRasterize = false
        bottomView.layer.rasterizationScale =  1
        bottomView.backgroundColor = UIColor.AppColors.backgroundBlack
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        avatarImage.clipsToBounds = true
        xAxis = UIScreen.main.bounds.width - Constants.paddingAnimationRight
    }
    
    func setBinding() {
        viewModel.reloadCollection = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.highlightsCollection.reloadData()
            strongSelf.clipTableView.reloadData()
        }
    }
    
    func configureCollection() {
        highlightsCollection.registerNib(HighlightCollectionViewCell.stringRepresentation)
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection  = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 30)
        highlightsCollection.setCollectionViewLayout(layout, animated: true)
        highlightsCollection.backgroundColor = UIColor.AppColors.backgroundBlack
    }
    
    func configureTableView() {
        clipTableView.registerNib(ClipTableViewCell.stringRepresentation)
        clipTableView.registerNib(CommentsTableViewCell.stringRepresentation)
        clipTableView.separatorStyle = .none
        clipTableView.backgroundColor = UIColor.AppColors.backgroundBlack
    }
    
    
    @IBAction func addStar(_ sender: UIImageView) {
        viewModel.starsAdded += 1
        if xAxis > UIScreen.main.bounds.width - 20 {
            xAxis = UIScreen.main.bounds.width - Constants.paddingAnimationRight
        }
        let label = UILabel.init(frame: CGRect.init(x: xAxis, y: 0.0, width: Constants.paddingAnimationRight, height: 26))
        label.text = "+\(viewModel.starsAdded)"
        label.textColor = getRandomColor()
        label.font = label.font.withSize(24.0)
        bottomView.addSubview(label)
        xAxis += xNextPositionFrame
        
        label.layer.add(constructAnimation(), forKey: Constants.positionPath)
        label.layer.add(opacityAnimation(), forKey: Constants.opacityPath)
        label.layer.position = CGPoint.init(x: xAxis, y: Constants.yFinalAxis)
        
        let delay: TimeInterval = TimeInterval(1.0)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            label.removeFromSuperview()
        }
        
    }
    
    func constructAnimation()-> CABasicAnimation {
        let startPoint = CGPoint.init(x: xAxis, y: 0)
        let endPoint = CGPoint.init(x: xAxis, y: Constants.yFinalAxis)
        let duration: Double = 1.2
        
        let animation = CABasicAnimation.init(keyPath: Constants.positionPath)
        animation.fromValue = NSValue.init(cgPoint: startPoint)
        animation.toValue = NSValue.init(cgPoint: endPoint)
        animation.duration = duration
        animation.timingFunction = CAMediaTimingFunction.init(name: .easeIn)
        return animation
        
    }
    
    func opacityAnimation()-> CABasicAnimation {
        let animation = CABasicAnimation.init(keyPath: Constants.opacityPath)
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = 1.3
        return animation
    }
    
    
    private func getRandomColor()-> UIColor {
        let randomNumber = Int.random(in: 0 ..< colors.count)
        return colors[randomNumber]
    }
}

extension ClipsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = highlightsCollection.dequeueReusableCell(withReuseIdentifier: HighlightCollectionViewCell.stringRepresentation, for: indexPath) as!  HighlightCollectionViewCell
        let item = viewModel.dataSource[indexPath.row]
        cell.configureCell(clip: item)
        return cell
    }
}

extension ClipsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.sizeCellCollection, height: Constants.sizeCellCollection)
    }
}

extension ClipsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows: Int = Constants.firstRow
        if let video = viewModel.currentVideo {
            rows = video.comments.count + Constants.clipCellPosition
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == Constants.firstRow {
            let cell : ClipTableViewCell = tableView.dequeueReusableCell(withIdentifier: ClipTableViewCell.stringRepresentation, for: indexPath) as! ClipTableViewCell
            cell.configureCell(video: viewModel.currentVideo)
            return cell
        }else {
            let cell : CommentsTableViewCell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.stringRepresentation, for: indexPath) as! CommentsTableViewCell
            cell.configureCell(comment: viewModel.currentVideo.comments[indexPath.row - Constants.clipCellPosition])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = Constants.clipCellHeight
        if indexPath.row > Constants.firstRow {
            height = Constants.commentsCellHeight
        }
        return height
    }
}
