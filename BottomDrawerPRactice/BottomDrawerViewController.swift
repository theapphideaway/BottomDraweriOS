//
//  BottomDrawerViewController.swift
//  BottomDrawerPRactice
//
//  Created by ian schoenrock on 12/13/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit

class BottomDrawerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(BottomDrawerViewController.panGesture))
        
        view.addGestureRecognizer(gesture)
        roundCorners(cornerRadius: 20)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1) { [weak self] in
            let frame = self?.view.frame
            let yComponent = UIScreen.main.bounds.height - 200
            self?.view.frame = CGRect(x: 0, y: yComponent, width: frame!.width, height: frame!.height)
        }
        
        
    }
    
    @objc func panGesture(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let y = self.view.frame.minY
        
        self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        if(recognizer.state == .ended){
            print(view.frame.height)
            if(y > view.frame.height * 0.50){
                
                UIView.animate(withDuration: 0.5){[weak self ] in
                    self!.view.frame = CGRect(x: 0, y: self!.view.frame.height * 0.80, width: self!.view.frame.width, height: self!.view.frame.height)
                }
            } else{
                 UIView.animate(withDuration: 0.5){[weak self ] in
                                   self!.view.frame = CGRect(x: 0, y: self!.view.frame.height * 0.10, width: self!.view.frame.width, height: self!.view.frame.height)
                               }
            }
        }
    }
    
    func roundCorners(cornerRadius: Double) {
        self.view.layer.cornerRadius = CGFloat(cornerRadius)
        self.view.clipsToBounds = true
    }
}
