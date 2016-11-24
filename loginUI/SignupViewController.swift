//
//  SignupViewController.swift
//  loginUI
//
//  Created by Lovish Dogra on 24/11/16.
//  Copyright © 2016 Lovish Dogra. All rights reserved.
//

import UIKit
import FontAwesome_swift

class SignupViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var createNewButton: UIButton!
    
    //MARK: IBAction
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func createNewButton(_ sender: Any) {
    }
    
    //MARK: View methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Close Button
        closeButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 20)
        closeButton.setTitle(String.fontAwesomeIcon(name: .close), for: .normal)
        closeButton.clipsToBounds = true
        
        //MARK: Create New Account Button
        createNewButton.layer.cornerRadius = createNewButton.frame.height / 2
        createNewButton.layer.shadowColor = UIColor.flatMintDark.cgColor
        createNewButton.layer.shadowOffset = CGSize(width:4, height:4)
        createNewButton.layer.shadowOpacity = 0.3
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
