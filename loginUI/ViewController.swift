//
//  ViewController.swift
//  loginUI
//
//  Created by Lovish Dogra on 24/11/16.
//  Copyright © 2016 Lovish Dogra. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var forgetPassword: UIButton!
    @IBOutlet var welcomeText: UILabel!
    
    //MARK: IBAction
    @IBAction func signInButton(_ sender: Any) {
        
    }
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Customize Button
        signInButton.layer.cornerRadius = signInButton.frame.height / 2
        signInButton.layer.shadowColor = UIColor.flatMintDark.cgColor
        signInButton.layer.shadowOffset = CGSize(width:4, height:4)
        signInButton.layer.shadowOpacity = 0.3
        
        //MARK: Customize Forget password
        let attributedString = NSAttributedString(string: "Forget password?", attributes: [NSUnderlineStyleAttributeName:1,NSForegroundColorAttributeName:UIColor.black])
        forgetPassword.setAttributedTitle(attributedString, for: .normal)
        
        //MARK: Customize text spacing
        welcomeText.addTextSpacing(5)
        
        //MARK: Hide navigation controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: UILabel Extension for customization
extension UILabel{
    func addTextSpacing(_ spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: text!.characters.count))
        attributedText = attributedString
    }
}
