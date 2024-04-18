//
//  LoginViewController.swift
//  PruebasCheps
//
//  Created by Oscar Prado on 11/03/24.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imgBG: UIImageView!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnViewPassword: UIButton!
    @IBOutlet weak var imgLogo: UIImageView!
    
    var userNametextField: UITextField? = {
        let TextField = UITextField ()
        TextField.placeholder = "Username"
        TextField.borderStyle = .roundedRect
        return TextField
        
    }()
    
    //ciclo de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userRegistered = UserDefaults.standard.bool(forKey: "userRegistered")
            
            if userRegistered {
                let homeViewController = HomeViewController()
                navigationController?.setViewControllers([homeViewController], animated: false)
            } else {
                let registerViewController = RegisterViewController()
                navigationController?.setViewControllers([registerViewController], animated: false)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupIntertface()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    //Interfaz Grafica
    
    func setupIntertface(){
        txtUsername?.placeholder = "Username"
        txtUsername?.borderStyle = .roundedRect
        txtPassword?.placeholder = "Password"
        txtPassword?.borderStyle = .roundedRect
        
    }
    //Boton de seguridad para vista de contraseña
    @IBAction func btnShowPasswordAction(_ sender: Any) {
    
        txtPassword.isSecureTextEntry = false
    }
    
    @IBAction func btnhidePassword(_ sender: Any) {
        txtPassword.isSecureTextEntry = true
    }
    //boton de login con errores
    @IBAction func btnLogin(_ sender: Any) {
        if isValidUserName(userName: txtUsername.text){
            if isValidPassWord(passWord: txtPassword.text){
                openHomeViewController()
            }else{
                let alertConntroller = UIAlertController(title: "aviso", message: "error en la contraseña", preferredStyle: .alert)
                alertConntroller.addAction(UIAlertAction(title: "Aceptar", style: .default))
                self.present(alertConntroller, animated: true)
            }
        }else{
            let errorMesaje = errorTypeUserName(username: txtUsername.text ?? "")
            let alertConntroller = UIAlertController(title: "aviso", message: errorMesaje, preferredStyle: .alert)
            alertConntroller.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alertConntroller, animated: true)
        }
    }
    //funcion para nueva vista en XIB
    func openHomeViewController () {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: homeViewController)
        // self.navigationController?.pushViewController(homeViewController, animated: true)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    //Validacion especifica de mas de 5 letras en Username
    func isValidUserName(userName:String?) -> Bool{
        if let userL = userName, !userL.isEmpty, userL.count  > 5{
            return true
        }
        return false
    }
    //error en Username por menos de 6 caracteres
    func errorTypeUserName(username:String) -> String{
        if username.count < 6{
            return "el usuario debe teenr minimo 6 caracteres"
        }
        return "error de usuario"
    }
    
    func isValidPassWord(passWord:String?) -> Bool{
        if let passL = passWord, !passL.isEmpty{
            return true
        }
        return false
    }
}
//Transformacion a mayusculas al escribir el usuario
extension LoginViewController: UITextFieldDelegate{
    
    func textField (_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == ""{
            return true
        }
        if textField == txtUsername {
            textField.text = (textField.text ?? "") + string.uppercased()
            return false
        }
        return true
    }
    
}

