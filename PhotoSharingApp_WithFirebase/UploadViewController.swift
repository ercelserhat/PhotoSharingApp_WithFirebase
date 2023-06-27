//
//  UploadViewController.swift
//  PhotoSharingApp_WithFirebase
//
//  Created by Serhat on 26.06.2023.
//

import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yorumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(fotografSec))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func fotografSec(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.dismiss(animated: true)
        
    }
    

    @IBAction func uploadButonTiklandi(_ sender: Any) {
    }
    
}
