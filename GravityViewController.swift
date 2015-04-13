//
//  GravityViewController.swift
//  GravityDemo
//
//  Created by 洪亞偉 on 15/4/13.
//  Copyright (c) 2015年 Raincle. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController
{

    @IBOutlet weak var AnimationView: UIView!
    
    var dropsPerRow = 10
    var dropSize: CGSize {
        let size = AnimationView.bounds.width / CGFloat(dropsPerRow)
        return CGSize(width: size, height: size)
    }
    
    //Animator
    lazy var animator: UIDynamicAnimator = {
        let lazilyCreatedDynamicAnimator = UIDynamicAnimator(referenceView: self.AnimationView)
        return lazilyCreatedDynamicAnimator
        }()
    
    //Gravity
    let gravity = UIGravityBehavior()
    
    //Collision
    lazy var collider:UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(gravity)
        animator.addBehavior(collider)
    }
    @IBAction func dropGestrue(sender: UITapGestureRecognizer) {
        
        drop()
    }
    
    func drop(){
        var frame = CGRect(origin: CGPointZero, size: dropSize)
        frame.origin.x = CGFloat.random(dropsPerRow) * dropSize.width
        
        var dropView = UIView(frame: frame)
        dropView.backgroundColor = UIColor.randomColor
        
        AnimationView.addSubview(dropView)
        gravity.addItem(dropView)
        collider.addItem(dropView)
    }
    
}

