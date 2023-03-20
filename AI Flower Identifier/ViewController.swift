//
//  ViewController.swift
//  AI Flower Identifier
//
//  Created by Grzegorz on 20/03/2023.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        
    }


    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
}

//MARK: - UIImagePickerControllerDelegate Methods
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
                
            guard let ciImage = CIImage(image: pickedImage) else {
                fatalError("Cannot convert to CIImage")
            }
            
            imageView.image = pickedImage
            
        }
        
        
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(inage: CIImage) {
        
    }
}

