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

    @IBOutlet weak var startLabel: UILabel!
    
    @IBOutlet weak var AnimationView: UIView!
    var hasShowAlert = false

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
        if startLabel.alpha == 1 {
            for i in 1...36 {
                drop()
            }
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(1)
            startLabel.alpha = 0
            UIView.commitAnimations()
            
        }
        
        drop()
    }
    
    func drop(){
        var frame = CGRect(origin: CGPointZero, size: dropSize)
        frame.origin.x = CGFloat.random(dropsPerRow) * dropSize.width
        
        var dropView = UIView(frame: frame)
        var color = UIColor.randomColor

        dropView.backgroundColor = color
        dropView.layer.cornerRadius = 10
        dropView.layer.masksToBounds = true
        dropView.layer.borderWidth = 1
        
        AnimationView.addSubview(dropView)
        gravity.addItem(dropView)
        collider.addItem(dropView)
    }
    
    
    
    @IBAction func longPress(sender: UILongPressGestureRecognizer) {
        if !hasShowAlert {
            var alert = UIAlertController(title: "Restart", message: "Would you like to restart?", preferredStyle: UIAlertControllerStyle.Alert)
            var okAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction!) -> Void in
                self.hasShowAlert = false
                self.startLabel.alpha = 1
                for view in self.AnimationView.subviews {
                    if view.tag == 0 {
                        self.gravity.removeItem(view as! UIDynamicItem)
                        self.collider.removeItem(view as! UIDynamicItem)
                        view.removeFromSuperview()
                    }
                }
            }
            var cancelAction = UIAlertAction(title: "Cancel", style: .Default) {
                action in
                self.hasShowAlert = false
            }
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: { () -> Void in
                self.hasShowAlert = true
            })
        }
    }
}

