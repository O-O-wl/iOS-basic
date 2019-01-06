//
//  ImagePickerControllerDelegationVC.swift
//  Delegate_Test
//
//  Created by 이동영 on 05/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit

class ImagePickerControllerDelegationVC : UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
      
        imgView.layer.borderWidth = 1
    }
    @IBOutlet var imgView: UIImageView!
    
    
    @IBAction func btnPick(_ sender: UIButton) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: false)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: false){ () in
            let alert = UIAlertController(title: "이미지선택", message: "이미지 선택을 취소하셨습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style:.cancel))
            self.present(alert, animated: false )
            
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false){
            () in
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}
