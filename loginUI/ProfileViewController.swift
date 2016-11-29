//
//  ProfileViewController.swift
//  loginUI
//
//  Created by Lovish Dogra on 25/11/16.
//  Copyright © 2016 Lovish Dogra. All rights reserved.
//

import UIKit
import TwitterKit

class ProfileViewController: UIViewController {
    
    //MARK: Constants
    let client = TWTRAPIClient.withCurrentUser()
    

    //MARK: IBOutlet
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        
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
