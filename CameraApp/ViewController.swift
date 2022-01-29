//
//  ViewController.swift
//  CameraApp
//
//  Created by Takeya Shimizu on 2022/01/29.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

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
        // サイズが大きすぎるとSNS側で投稿時に画面が落ちてしまうので、5MB以内にリサイズする
        if let sharedImage = photoImage.image?.fixedOrientation()?.resizeImage(maxSize: 5 * 1024 * 1024) {
            // 投稿用の配列の入れ物を用意
            let sharedItems = [sharedImage]
            let controller = UIActivityViewController(activityItems: sharedItems, applicationActivities: nil)
            controller.popoverPresentationController?.sourceView = view // iPad対策らしい
            // シェア用のメニューを表示
            present(controller, animated: true, completion: nil)
        }
    }

    // 写真を撮った後に呼ばれる delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImage.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}

