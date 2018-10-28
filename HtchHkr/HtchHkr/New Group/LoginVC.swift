//
//  LoginVC.swift
//  HtchHkr
//
//  Created by Zach Cervi on 10/27/18.
//  Copyright © 2018 Zach Cervi. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, UITextFieldDelegate {
    
    //IBOutlets
    @IBOutlet weak var emailTextField: RoundedCornerTextField!
    @IBOutlet weak var passwordTextField: RoundedCornerTextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var authButton: RoundedShadowButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
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
    
    @IBAction func authButtonPressed(_ sender: Any) {
        if emailTextField.text != nil && passwordTextField.text != nil {
            authButton.animateButton(shouldLoad: true, withMessage: nil)
            self.view.endEditing(true)
            
            if let email = emailTextField.text, let password = passwordTextField.text {
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    
                    if error == nil {
                        if let user = user {
                            if self.segmentedControl.selectedSegmentIndex == 0 {
                                let userData = ["provider": user.user.uid] as [String: Any]
                                DataService.instance.createFireBaseDBUser(uid: user.user.uid, userData: userData, isDriver: false)
                            } else {
                                let userData = ["provider": user.user.uid, "userIsDriver": true, "isPickupModeEnabled": false, "driverIsOnTrip": false] as [String: Any]
                                DataService.instance.createFireBaseDBUser(uid: user.user.uid, userData: userData, isDriver: true)
                            }
                        }
                        print("Email user authenticated successfully with Firebase")
                        self.dismiss(animated: true, completion: nil)
                    }else {
                        if let errorCode = AuthErrorCode(rawValue: error!._code){
                            switch errorCode{
                            case .wrongPassword:
                                print("Password did not match email.")
                            default:
                                print("An unexpected error occurred.")
                            }
                        }
                        
                        
                        
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                if let errorCode = AuthErrorCode(rawValue: error!._code){
                                    switch errorCode {
                                    case .emailAlreadyInUse:
                                        print("That email is already in use.")
                                    case .invalidEmail:
                                        print("That is an invalid email. Please try again.")
                                    
                                    default:
                                    print("An unexpected error occurred.")
                                    }
                                }
                            }
                            else {
                                if let user = user {
                                    if self.segmentedControl.selectedSegmentIndex == 0 {
                                        let userData = ["provider": user.user.providerID] as [String: Any]
                                        DataService.instance.createFireBaseDBUser(uid: user.user.uid, userData: userData, isDriver: false)
                                    }else {
                                        let userData = ["provider": user.user.providerID, "userIsDriver": true, "isPickupModeEnabled": false, "driverIsOnTrip": false] as [String: Any]
                                        DataService.instance.createFireBaseDBUser(uid: user.user.uid, userData: userData, isDriver: true)
                                    }
                                }
                                print("Successfully created a new user with Firebase!")
                                self.dismiss(animated: true, completion: nil)
                            }
                        })
                    }
                }
            }
        }
    }
}
