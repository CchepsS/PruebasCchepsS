//
//  RegisterViewController.swift
//  PruebasCheps
//
//  Created by Oscar Prado on 16/04/24.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    @IBOutlet weak var datePickerBirthday: UIDatePicker!
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUpInterface()
        title = "WELCOME"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func setUpInterface() {
        userTextField.placeholder = "Username"
        emailTextField.placeholder = "Email"
        passwordTextFIeld.placeholder = "New Password"
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        guard let username = userTextField.text, !username.isEmpty else {
            
            return
        }
        guard let email = emailTextField.text, !email.isEmpty, email.isValidEmail else {
            
            return
        }
        guard let password = passwordTextFIeld.text, !password.isEmpty, password.count >= 8 else {
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let birthdate = dateFormatter.string(from: datePickerBirthday.date)
        
        let defaults = UserDefaults.standard
        defaults.set(userTextField.text, forKey: "User")
        defaults.set(emailTextField.text, forKey: "Email")
        defaults.set(passwordTextFIeld.text, forKey: "Password")
        defaults.set(birthdate, forKey: "Birthdate")
       
        defaults.set(true, forKey: "userRegistered")
            
            let homeViewController = HomeViewController()
            navigationController?.setViewControllers([homeViewController], animated: true)
        
    }
}
    
    extension String {
        var isValidEmail: Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            return NSPredicate(format: "SELF MATCHES %@" ,emailRegex).evaluate(with: self)
            
        }
    }
    
    
    
    
