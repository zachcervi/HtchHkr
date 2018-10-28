//
//  HomeVC.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/18/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit
import RevealingSplashView

class HomeVC: UIViewController {

    @IBOutlet weak var actionBtn: RoundedShadowButton!
    
    var delegate: CenterVCDelegate?
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")! , iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        
        revealingSplashView.heartAttack = true
        
    }
    @IBAction func actionBtnPressed(_ sender: Any) {
        actionBtn.animateButton(shouldLoad: true, withMessage: nil)
    }
    
    @IBAction func menuBtnWasPressed(_ sender: Any) {
        delegate?.toggleLeftPanel()
    }
    
    
}

