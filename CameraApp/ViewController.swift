//
//  ViewController.swift
//  CameraApp
//
//  Created by Takeya Shimizu on 2022/01/29.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var photoImage: UIImageView!

    @IBAction func cameraLaunchAction(_ sender: Any) {
        // カメラにアクセスできるか
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera can be used.")
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            present(ipc, animated: true, completion: nil)
        } else {
            print("Camera is not available.")
        }
    }

    @IBAction func shareAction(_ sender: Any) {
    }

    // 写真を撮った後に呼ばれる delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImage.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}

