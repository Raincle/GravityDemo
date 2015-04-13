//
//  Extensions.swift
//  GravityDemo
//
//  Created by 洪亞偉 on 15/4/13.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//


import UIKit

extension CGFloat {
    static func random(max: Int) -> CGFloat {
        var random = arc4random() % UInt32(max)
        return CGFloat(random)
    }
}


extension UIColor {
    class var randomColor: UIColor {
        switch arc4random()%5 {
        case 0: return UIColor(red: CGFloat(250.0/255.0), green: CGFloat(245.0/255.0), blue: CGFloat(185.0/255.0), alpha: 1)
        case 1: return UIColor(red: CGFloat(220.0/255.0), green: CGFloat(245.0/255.0), blue: CGFloat(185.0/255.0), alpha: 1)
        case 2: return UIColor(red: CGFloat(205.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(240.0/255.0), alpha: 1)
        case 3: return UIColor(red: CGFloat(255.0/255.0), green: CGFloat(230.0/255.0), blue: CGFloat(250.0/255.0), alpha: 1)
        case 4: return UIColor(red: CGFloat(230.0/255.0), green: CGFloat(220.0/255.0), blue: CGFloat(250.0/255.0), alpha: 1)
        default:return UIColor.whiteColor()
        }
    }
}