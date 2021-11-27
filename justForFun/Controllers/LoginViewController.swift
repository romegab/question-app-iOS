//
//  LoginViewController.swift
//  justForFun
//
//  Created by Petar Petrov on 27.11.21.
//
import Firebase
import UIKit

class LoginViewController : UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error)
            }else{
                print("User succesfuly logged in")
            }
        }
        
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        
    }
}
