//
//  ViewController.swift
//  loginUI
//
//  Created by Lovish Dogra on 24/11/16.
//  Copyright © 2016 Lovish Dogra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var forgetPassword: UIButton!
    
    //MARK: IBAction
    @IBAction func signInButton(_ sender: Any) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = signInButton.frame.height / 2
        signInButton.layer.shadowColor = UIColor.black.cgColor
        signInButton.layer.shadowOffset = CGSize(width:2, height:2)
        signInButton.layer.shadowOpacity = 0.3
        
        let attributedString = NSAttributedString(string: "Forget password?", attributes: [NSUnderlineStyleAttributeName:1])
        forgetPassword.setAttributedTitle(attributedString, for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
