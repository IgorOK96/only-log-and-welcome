//
//  LoginViewController.swift
//  only log and welcome
//
//  Created by user246073 on 9/9/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let trueName = "Igor"
    private let truePass = "Swift001"
    private var userName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.text = trueName
        passwordTF.text = truePass
        userName = userNameTF.text
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {
            return
        }
        welcomeVC.userName = userName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier welcomeIndent: String, sender: Any?) -> Bool {
        guard userNameTF.text == trueName, passwordTF.text == truePass else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password") {
                    self.passwordTF.text = ""
                }
            return false
        }
        return true
    }
    
    @IBAction func forgotUserName(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "Your name is \(trueName) 😉")
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        showAlert(title: "Oops!", message: "Your password is \(truePass) 😉")
    }
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

