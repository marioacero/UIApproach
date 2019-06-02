//
//  Extension.swift
//  StreamLabsUI
//
//  Created by Mario Acero on 6/1/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    class var stringRepresentation: String {
        let name = String(describing: self)
        return name
    }
}


extension UICollectionView {
    
    internal func registerNib(_ nibName: String) {
        let cellNib = UINib.init(nibName: nibName, bundle: nil)
        register(cellNib, forCellWithReuseIdentifier: nibName)
    }
}

extension UITableView {
    
    internal func registerNib(_ nibName: String) {
        let cellNib = UINib.init(nibName: nibName, bundle: nil)
        register(cellNib, forCellReuseIdentifier: nibName)
    }
}

extension UIColor {
    
    struct AppColors {
        
        static var backgroundBlackShadow: UIColor {
            return UIColor.init(hexString: "#151E25")
        }
        
        static var backgroundBlack: UIColor {
            return UIColor(hexString: "#16242d")
        }
        static var yellowGradient: UIColor {
            return UIColor(hexString: "#DE981F")
        }
        
        static var purpleGradient: UIColor {
            return UIColor(hexString: "#4F1F9A")
        }
        
        static var blue: UIColor {
            return UIColor(hexString: "#0096FF")
        }
        
        static var strawBerry: UIColor {
            return UIColor(hexString: "#FF2F92")
        }
        
        static var green: UIColor {
            return UIColor(hexString: "#00F900")
        }
        
    }
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
}

extension UIView {
    
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
}

