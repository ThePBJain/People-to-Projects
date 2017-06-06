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
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        //self.view.backgroundColor = UIColorFromRGB(0x65ff7c);
    }
    override func viewWillAppear(_ animated: Bool) {
        if (PFUser == "unknown") {
            DispatchQueue.main.async(execute: { () -> Void in
                
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                //nameLabel.text("Tesst")
                self.present(viewController, animated: true, completion: nil)
            })
        }
    }
    func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
