//
//  ViewController.swift
//  cameraSAS
//
//  Created by Grayson Bianco on 10/28/16.
//  Copyright © 2016 InfinityGT. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var camera: UIButton!
    @IBOutlet weak var photos: UIButton!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var emergency: UIButton!
    @IBOutlet weak var suspicious: UIButton!
    
    @IBOutlet weak var context: UILabel!
    @IBOutlet weak var photoDisp: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func libraryAction(_ sender: UIButton) {
        
//        let imgSelect = UIImagePickerController()
//        imgSelect.delegate = self
//        imgSelect.sourceType = .photoLibrary
//        
//        present(imgSelect, animated: true, completion: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imgSelect = UIImagePickerController()
            imgSelect.delegate = self
            imgSelect.sourceType = .photoLibrary;
            imgSelect.allowsEditing = true
            self.present(imgSelect, animated: true, completion: nil)
        }
        
    }

    @IBAction func cameraAction(_ sender: UIButton) {
        
//        let imgSelect = UIImagePickerController()
//        imgSelect.delegate = self
//        imgSelect.sourceType = .camera
//        
//        present(imgSelect, animated: true, completion: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imgSelect = UIImagePickerController()
            imgSelect.delegate = self
            imgSelect.sourceType = .camera;
            imgSelect.allowsEditing = false
            self.present(imgSelect, animated: true, completion: nil)
        }
    }
    
    @IBAction func videoAction(_ sender: UIButton) {
        
        //        let imgSelect = UIImagePickerController()
        //        imgSelect.delegate = self
        //        imgSelect.sourceType = .camera
        //
        //        present(imgSelect, animated: true, completion: nil)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imgSelect = UIImagePickerController()
            imgSelect.delegate = self
            imgSelect.sourceType = .camera;
            imgSelect.mediaTypes = [kUTTypeMovie as String]
            imgSelect.allowsEditing = false
            
            imgSelect.showsCameraControls = true
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        let imgData = UIImageJPEGRepresentation(photoDisp.image!, 0.5)
        let compressed = UIImage(data: imgData!)
        UIImageWriteToSavedPhotosAlbum(compressed!, nil, nil, nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoDisp.image = info[UIImagePickerControllerOriginalImage] as! UIImage!
        self.dismiss(animated: true, completion: nil)

//        camera.isHidden = false
//        library.isHidden = false
//        emergency.isHidden = false
//        suspicious.isHidden = false
//        imgContext.isHidden = false
//        contextLabel.isHidden = false
    }
    
}
