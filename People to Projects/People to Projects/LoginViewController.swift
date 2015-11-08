//
//  LoginViewController.swift
//  People to Projects
//
//  Created by Pranav Jain on 11/8/15.
//  Copyright © 2015 Pranav Jain. All rights reserved.
//

import Foundation
import UIKit
import Firebase
var data: [String] = [];
class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToLogInScreen(segue:UIStoryboardSegue) {
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        var username = self.usernameField.text
        var password = self.passwordField.text
        
        // Validate the text fields
        if username!.characters.count < 5 {
            var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 5 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        } else if password!.characters.count < 8 {
            var alert = UIAlertView(title: "Invalid", message: "Password must be greater than 8 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        } else {
            // Run a spinner to show a task in progress
            var spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
            spinner.startAnimating()
            
            // Send a request to login
            let ref = Firebase(url: "https://popping-heat-3486.firebaseio.com")
            ref.authUser(username, password: password,
                withCompletionBlock: { error, authData in
                     spinner.stopAnimating()
                    if error != nil {
                        // There was an error logging in to this account
                        print("Error: \(error)")
                    } else {
                        // We are now logged in
                        print(authData)
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MyTable") as! UIViewController
                            self.presentViewController(viewController, animated: true, completion: nil)
                            PFUser = "known"
                        })

                    }
            })
            //var data = Firebase(url:"https://docs-examples.firebaseio.com/web/saving-data/fireblog/posts")
            // Retrieve new posts as they are added to your database
            ref.observeEventType(.ChildAdded, withBlock: { snapshot in
                print(snapshot.value.valueForKey("peopleToProjects")?.description)
                //data.append((snapshot.value.valueForKey("peopleToProjects")?.description)!)
                print("The project is: \(snapshot.value.objectForKey("projects"))")
            })
           
        }
    }
    
}
