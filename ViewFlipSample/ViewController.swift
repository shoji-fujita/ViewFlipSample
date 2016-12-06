//
//  ViewController.swift
//  ViewFlipSample
//
//  Created by shoji on 2016/12/03.
//  Copyright © 2016年 shoji fujita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isFront = true
    let view0 = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    var flipFromLeft = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(view0)
        view1.backgroundColor = .red
        view2.backgroundColor = .blue
        view0.addSubview(view1)
        view0.addSubview(view2)
        view0.bringSubview(toFront: view1)
    }
    
    func flip(isFront: Bool) {
        if isFront {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromLeft]
            UIView.transition(with: view0, duration: 1.0, options: transitionOptions, animations: {
                self.view0.bringSubview(toFront: self.view2)
            })
        } else {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight]
            UIView.transition(with: view0, duration: 1.0, options: transitionOptions, animations: {
                self.view0.bringSubview(toFront: self.view1)
            })
        }
        self.isFront = !isFront
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        flip(isFront: isFront)
    }
    
}
