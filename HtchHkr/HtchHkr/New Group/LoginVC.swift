//
//  LoginVC.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/27/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.bindToKeyboard()
      
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleScreenTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    @IBAction func cancelBtnPresses(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
