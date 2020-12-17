//
//  ResetViewController.swift
//  LoginApp
//
//  Created by xz4999 on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class ResetViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resetPassword(_ sender: Any) {
        let email = txtEmail.text
                        
               if email == "" {
                 lblStatus.text = "Please enter email and correct password"
                 return
                }
                if email?.isEmail == false {
                 lblStatus.text = "Please enter valid e mail"
                 return
                }
                        
                Auth.auth().sendPasswordReset(withEmail: email!) { error in
                //    guard let strongSelf = self else { return }
                            
                     if error != nil {
                        self.lblStatus.text = error?.localizedDescription
                        return
                    } else {
                        self.lblStatus.text = "Success"
                            }
                
            }
        }
    
    
    

       }
