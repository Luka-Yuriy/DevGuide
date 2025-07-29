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
    private let languages = Language.getLanguagesInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.text = "12"
        passwordTextField.text = "12"

    }

    @IBAction func loginButtonPressed() {
        guard loginTextField.text == user.login, passwordTextField.text == user.password else {
            showAlert(title: "Wrong login or password", message: "Use correncet login and password")
            return
        }
        
        performSegue(withIdentifier: "tabBar", sender: nil)
    }
    
    @IBAction func fogotUserData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Your login is: ", message: "\(user.login)")
        : showAlert(title: "Your password is:", message: "\(user.password)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let navigationVC = viewController as? UINavigationController {
                if let languagesVC = navigationVC.topViewController as? LanguagesTableViewController {
                    languagesVC.languages = languages
                }
            }
        }
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

