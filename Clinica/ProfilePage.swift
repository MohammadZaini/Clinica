//
//  ProfilePage.swift
//  Clinica
//
//  Created by htu on 07/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class ProfilePage: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var PatientImage: UIImageView!
    @IBOutlet weak var AddphotoButton: UIButton!
    @IBOutlet weak var UploadPhotoButton: UIButton!
    
    @IBAction func AddPhotoTapped(_ sender: UIButton) {
        ShowPhotoAlert()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        Utilities.styleHollowButton(AddphotoButton)
        Utilities.styleHollowButton(UploadPhotoButton)
        PatientImage.layer.cornerRadius = PatientImage.frame.size.width / 2
        PatientImage.clipsToBounds = true
    }
    

    func ShowPhotoAlert(){
        
        let alert = UIAlertController(title: "Take photo from", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            
            self.getPhoto(type: .camera)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            
            self.getPhoto(type: .photoLibrary)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func getPhoto(type : UIImagePickerController.SourceType){
        
        let picker = UIImagePickerController()
        picker.sourceType = type
        //picker.isEditing = true 
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true, completion: nil)
        guard let  image = info[.originalImage] as? UIImage else{
            print("Image not found")
            return
        }
        
        PatientImage.image = image

            }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

}
