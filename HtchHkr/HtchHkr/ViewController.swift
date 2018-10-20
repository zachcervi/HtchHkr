//
//  ViewController.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/18/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actionBtn: RoundedShadowButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func actionBtnPressed(_ sender: Any) {
        actionBtn.animateButton(shouldLoad: true, withMessage: nil)
    }
    

}

