//
//  ResetPasswordViewController.swift
//  People to Projects
//
//  Created by Pranav Jain on 11/7/15.
//  Copyright © 2015 Pranav Jain. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func passwordReset(_ sender: AnyObject) {
        let email = self.emailField.text
        let finalEmail = email!.trimmingCharacters(in: CharacterSet.whitespaces)
        
        // Send a request to reset a password
        let ref = Firebase(url: "https://popping-heat-3486.firebaseio.com")
        ref?.resetPassword(forUser: finalEmail, withCompletionBlock: { error in
            if error != nil {
                // There was an error processing the request
                let alert = UIAlertController (title: "Password Reset", message: "Error: Email failed to send. ", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                // Password reset sent successfully
                let alert = UIAlertController (title: "Password Reset", message: "An email containing information on how to reset your password has been sent to " + finalEmail + ".", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
