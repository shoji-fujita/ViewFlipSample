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
    let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var flipFromLeft = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.backgroundColor = .red
        view2.backgroundColor = .blue
        view.addSubview(view1)
        view.addSubview(view2)
        view2.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        flip(isFront: false)
    }
    
    func flip(isFront: Bool) {
        if isFront {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromLeft]
            UIView.transition(with: view1, duration: 1.0, options: transitionOptions, animations: {
                self.view1.isHidden = false
            })
            UIView.transition(with: view2, duration: 1.0, options: transitionOptions, animations: {
                self.view2.isHidden = true
            })
        } else {
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight]
            UIView.transition(with: view1, duration: 1.0, options: transitionOptions, animations: {
                self.view1.isHidden = true
            })
            UIView.transition(with: view2, duration: 1.0, options: transitionOptions, animations: {
                self.view2.isHidden = false
            })
        }
        self.isFront = !isFront
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        flip(isFront: isFront)
    }
    
}
