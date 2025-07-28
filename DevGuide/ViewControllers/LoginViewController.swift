//
//  ViewController.swift
//  DevGuide
//
//  Created by Yurii Luka on 27.07.2025.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginButtonPressed() {
        guard loginTextField.text == user.login, passwordTextField.text == user.password else {
            showAlert(title: "Wrong login or password", message: "Use correncet login and password")
            return
        }
        
        performSegue(withIdentifier: "1234", sender: nil)
    }
    
    @IBAction func fogotUserData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Your login is: ", message: "\(user.login)")
        : showAlert(title: "Your password is:", message: "\(user.password)")
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

