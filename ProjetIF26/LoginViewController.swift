//
//  LoginViewController.swift
//  ProjetIF26
//
//  Created by Vincent on 18/12/2018.
//  Copyright © 2018 GUILLOUX Valentin. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var UserNameTextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    @IBOutlet weak var SignIn: UIButton!
    
    @IBOutlet weak var Connect: UIButton!
    
    
    @IBAction func SignInAction(_ sender: Any) {
        
        let userDAO:UserDAO = UserDAO()
        let userTable = userDAO.getAllUser()
        
        
        var bool = false
        for user in userTable {
            if (user.getEmail() ==  UserNameTextField.text){
                bool = true
                let dialogMessage = UIAlertController(title: "Erreur", message: "L'utilisateur existe déjà", preferredStyle: .alert)
                // Create OK button with action handler
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    
                })
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
            }
        }
        if (bool == false){
            let alert = UIAlertController(title: "Pseudo", message: "Entrez votre pseudo", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: {
                (alertAction) in
                
                let textField = alert.textFields![0] as UITextField
                let user:User = User(email: self.UserNameTextField.text!, password: self.PasswordTextField.text!, userName: textField.text!)
                userDAO.insert(user: user)
                
                
            })
            alert.addTextField { (textField) in
                textField.placeholder = "Entrez votre pseudo"
            }
            alert.addAction(action)
            self.present(alert, animated:true, completion: nil)
        }
        
        
    }
    
    @IBAction func ConnectAction(_ sender: Any) {
        
        let userDAO:UserDAO = UserDAO()
        let userTable = userDAO.getAllUser()
        
        var emailCorrect = false
        var passwordCorrect = false
        for user in userTable {
            if (user.getEmail() ==  UserNameTextField.text){
                emailCorrect = true
                if (user.getPassword() ==  PasswordTextField.text){
                    passwordCorrect = true
                        UserDefaults.standard.set(user.getId(), forKey: "ConnectedUserID")
                    UserDefaults.standard.set(true, forKey: "isConnected")
                        //perform segue to acceuil
                    self.performSegue(withIdentifier: "connect", sender: nil)
                }
            }
        }
        if( emailCorrect == true &&  passwordCorrect == false){
            let dialogMessage = UIAlertController(title: "Erreur", message: "Mot de passe incorect", preferredStyle: .alert)
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                
            })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        if( emailCorrect == false ){
            let dialogMessage = UIAlertController(title: "Erreur", message: "L'utilisateur n'existe pas", preferredStyle: .alert)
            // Create OK button with action handler
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                
            })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            }
        }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "connect" {
            let mainVC = segue.destination as! ViewController
            //cacheTVC = selectedAnnotation as! CacheAnnotation
        }
        if segue.identifier == "register" {
            let mainVC = segue.destination as! ViewController
            //cacheTVC = selectedAnnotation as! CacheAnnotation
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PasswordTextField.text = ""
        UserNameTextField.text = ""
        
        PasswordTextField.isSecureTextEntry = true
        
        
        
        
        // Do any additional setup after loading the view.
        
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
