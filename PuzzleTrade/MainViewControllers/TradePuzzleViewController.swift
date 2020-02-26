//
//  TradePuzzleViewController.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/4/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import UIKit
import Toucan

class TradePuzzleViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private lazy var imagePickerController: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.delegate = self
        return ip
    }()
    

    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberOfPiecesTextField: UITextField!
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        imageButton.layer.borderWidth = 2
        imageButton.layer.borderColor = #colorLiteral(red: 0.3520373702, green: 0.7822065949, blue: 0.9811096787, alpha: 1)
        brandTextField.delegate = self
        nameTextField.delegate = self
        numberOfPiecesTextField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(postTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        unregisterKeyboardNotifications()
    }
    
    @objc func postTapped () {
        
    }
    
    @IBAction func imageButtonPressed(_ sender: Any) {
        showSheetAlert(title: "Please select option", message: nil) { (alertController) in
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true)
            }
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
                self.imagePickerController.sourceType = .photoLibrary
                self.present(self.imagePickerController, animated: true)
            }
            alertController.addAction(cameraAction)
            alertController.addAction(photoLibraryAction)
        }
    }
    

    


    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("original image is nil")
            return
        }
        guard let resizedUserImage = Toucan.init(image: originalImage).resize(CGSize(width: 500, height: 500)).image else {
            showAlert(title: "Error resizing image", message: nil)
            return
        }
        selectedImage = resizedUserImage
        imageButton.setImage(selectedImage, for: .normal)
        dismiss(animated: true)
    }
}

extension TradePuzzleViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
