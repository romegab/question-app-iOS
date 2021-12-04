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
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var errorView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorView.alpha = 0
        let placeholderFont = UIFont(name: "Marker Felt", size: 14) ?? UIFont.systemFont(ofSize: 14)
        
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: placeholderFont]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: placeholderFont]
        )
        
        errorView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        
        errorView.clipsToBounds = true
        errorView.layer.cornerRadius = 10
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                
                self.errorView.alpha = 1
                //error.localizedDescription
            }else{
                self.performSegue(withIdentifier: "showHomeScreen", sender: nil)
            }
        }
        
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        
    }
}
