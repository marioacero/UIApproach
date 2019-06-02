//
//  GradiantView.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation
import UIKit

class GradiantView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let path = UIBezierPath(roundedRect: self.bounds.insetBy(dx: 5, dy: 5), byRoundingCorners: [.topLeft, .bottomLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: frame.size.height / 2, height: frame.size.height / 2))
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: frame.size)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.3)
        gradient.endPoint = CGPoint(x: 0.8, y: 0.9)
        gradient.colors = [UIColor.AppColors.yellowGradient.cgColor, UIColor.AppColors.purpleGradient.cgColor]
        
        let shape = CAShapeLayer()
        shape.lineWidth = 4
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        layer.insertSublayer(gradient, at: 0)
    }
}
