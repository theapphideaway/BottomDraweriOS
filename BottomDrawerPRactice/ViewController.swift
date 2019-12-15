//
//  ViewController.swift
//  BottomDrawerPRactice
//
//  Created by ian schoenrock on 12/13/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBottomDrawerView()
    }

    func addBottomDrawerView(){
        let bottomDrawer = BottomDrawerViewController()
        
        self.addChild(bottomDrawer)
        self.view.addSubview(bottomDrawer.view)
        bottomDrawer.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: self.view.frame.maxX, height: self.view.frame.maxY )
    }

}

