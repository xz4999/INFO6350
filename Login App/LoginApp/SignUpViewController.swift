//
//  SignUpViewController.swift
//  LoginApp
//
//  Created by xz4999 on 11/16/20.
//

import UIKit
import Firebase
import SwiftSpinner

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter your Email address and correct Password"
            return
        }
        
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid Email address"
            return
        }
        
        Auth.auth().createUser(withEmail: email!, password: password!) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
                            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
                            
            self?.txtPassword.text = ""
            self!.performSegue(withIdentifier: "signupSegue", sender: strongSelf)
                            
            }
            
}
