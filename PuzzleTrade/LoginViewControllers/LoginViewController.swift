//
//  LoginViewController.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/20/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var authservice = AppDelegate.authservice
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToolbarButtontextfields(textfields: [emailTextField, passwordTextField])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        unregisterKeyboardNotifications()
    }

    private func addToolbarButtontextfields (textfields: [UITextField]) {
        let bar = UIToolbar()
        let reset = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        bar.items = [reset]
        bar.sizeToFit()
        for textField in textfields {
        textField.inputAccessoryView = bar
        }
    }
    
    private func loginUser() {
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            !email.isEmpty,
            !password.isEmpty else {
                showAlert(title: "Please complete missing textfields", message: nil)
                return
        }
        activityIndicator.startAnimating()
        authservice.signInExistingAccount(email: email, password: password)
    }
    
    @objc func doneTapped() {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension LoginViewController : AuthServiceExistingAccountDelegate {
    func didSignInToExistingAccount(_ authservice: AuthService, user: User) {
        segueToMainVC(userId: user.uid)
        
    }
    
        func didRecieveErrorSigningToExistingAccount(_ authservice: AuthService, error: Error) {
            showAlert(title: "Signin Error", message: error.localizedDescription)
        }
    
}
