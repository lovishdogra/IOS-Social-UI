//
//  ViewController.swift
//  loginUI
//
//  Created by Lovish Dogra on 24/11/16.
//  Copyright © 2016 Lovish Dogra. All rights reserved.
//

import UIKit
import ChameleonFramework
import FontAwesome_swift
import TwitterKit

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    //MARK: Constants
    let url = NSURL(string:"https://api.linkedin.com/v1/people/~")
    
    //MARK: IBOutlet
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var forgetPassword: UIButton!
    @IBOutlet var welcomeText: UILabel!
    @IBOutlet var googleButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var linkedinButton: UIButton!
    
    
    //MARK: IBAction
    @IBAction func signInButton(_ sender: Any) {
        
    }
    
    @IBAction func googleButton(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @IBAction func twitterButton(_ sender: Any) {
        Twitter.sharedInstance().logIn { (session: TWTRSession?, error) in
            if session != nil {
                print("twitter")
                print(session?.userName ?? "User is nil")
                self.toggleProfileView()
            }
        }
        
    }
    
    @IBAction func linkedinButton(_ sender: Any) {
        LISDKSessionManager.createSession(withAuth: [LISDK_BASIC_PROFILE_PERMISSION], state: nil, showGoToAppStoreDialog: true, successBlock: { (returnState) -> Void in
            print("success called!")
            //let session = LISDKSessionManager.sharedInstance().session
        }) { (error) -> Void in
            print("Error: \(error)")
        }
    }
    
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        //MARK: Custom Social Buttons
        googleButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 30)
        googleButton.setTitle(String.fontAwesomeIcon(name: .googlePlusSquare), for: .normal)
        twitterButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 30)
        twitterButton.setTitle(String.fontAwesomeIcon(name: .twitterSquare), for: .normal)
        linkedinButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 30)
        linkedinButton.setTitle(String.fontAwesomeIcon(name: .linkedInSquare), for: .normal)
        
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
        
        if(GIDSignIn.sharedInstance().hasAuthInKeychain()){
            print("already signedup")
            if(shouldPerformSegue(withIdentifier: "ProfileVC", sender: self)){
                print("possible")
                toggleProfileView()
            }
        }
        
        Twitter.sharedInstance().logIn { (session, error) in
            if error == nil {
                self.toggleProfileView()
                print("ViewControllerPresented")
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        present(viewController, animated: true, completion: nil)
    }
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        dismiss(animated: (viewController != nil), completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(user.profile.email)
    }
    
    
    func toggleProfileView(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier :"ProfileViewController")
//        //self.present(viewController, animated: true)
//        self.navigationController?.pushViewController(viewController, animated: true)
        performSegue(withIdentifier: "ProfileView", sender: self)
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
