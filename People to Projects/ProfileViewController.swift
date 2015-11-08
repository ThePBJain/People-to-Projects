//
//  ProfileViewController.swift
//  People to Projects
//
//  Created by Pranav Jain on 11/8/15.
//  Copyright © 2015 Pranav Jain. All rights reserved.
//

import UIKit
import Firebase

var PFUser = "unknown";
class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    override func viewWillAppear(animated: Bool) {
        if (PFUser == "unknown") {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
