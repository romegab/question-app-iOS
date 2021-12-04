//
//  RegisterViewController.swift
//  justForFun
//
//  Created by Petar Petrov on 27.11.21.
//
import Firebase
import UIKit

class RegisterViewController : UIViewController{
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorView: UIView!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
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
        
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Confirm password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: placeholderFont]
        )
        errorView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        errorView.clipsToBounds = true
        errorView.layer.cornerRadius = 10
        
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if (passwordTextField.text != confirmPasswordTextField.text){
            errorLabel.text = "Your passwords don't match"
            errorView.alpha = 1
        }else{
            guard let email = emailTextField.text else {return}
            guard let password = passwordTextField.text else {return}
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error{
                    print(error.localizedDescription)
                    self.errorLabel.text = error.localizedDescription
                    self.errorView.alpha = 1
                    
                    
                }else{
                    self.performSegue(withIdentifier: "showHomeScreen", sender: nil)
                }
            }
        
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for textField in self.view.subviews where textField is UITextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
