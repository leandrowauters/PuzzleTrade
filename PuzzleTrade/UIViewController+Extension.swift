//
//  UIViewController+Extension.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/20/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    public func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    public func showAlert(title: String?, message: String?, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: handler)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    public func showSheetAlert(title: String, message: String?, handler: @escaping (UIAlertController) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        handler(alertController)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            self.dismiss(animated: true)
        }
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    
    func registerKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc private func willHideKeyboard(){
        view.transform = CGAffineTransform.identity
    }
    
    @objc private func willShowKeyboard(notification: Notification){
        guard let info = notification.userInfo,
            let keyboardFrame = info["UIKeyboardFrameEndUserInfoKey"] as? CGRect else {
                print("UserInfo is nil")
                return
        }
        
        view.transform = CGAffineTransform(translationX: 0, y: -keyboardFrame.height + 150)
    }
}
