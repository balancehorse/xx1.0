//
//  CameraHandler.swift
//  0019-CameraAndPhotoLibrary
//
//  Created by lemo on 2018/4/13.
//  Copyright © 2018年 wangli. All rights reserved.
// 调用相机-相册工具

import UIKit

class CameraHandler: NSObject {
    
    static let shared = CameraHandler()
    
    fileprivate var currentVC: UIViewController!
    
    var imagePickedBlock: ((UIImage) -> Void)?
    
    //打开相机
    func camera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            currentVC.present(myPickerController, animated: true, completion: nil)
            
        } else {
            alertAction()
        }
    }
    
    //打开相册
    func photoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            currentVC.present(myPickerController, animated: true, completion: nil)
        } else {
            alertAction()
        }
    }
    
    //错误提示
    func alertAction() {
        let alertController = UIAlertController(title: "错误", message: "设备不支持相机", preferredStyle: UIAlertController.Style.actionSheet)
        let action = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.currentVC.present(alertController, animated: true, completion: nil)
    }
    
    //显示相册相册弹出框选择项
    func showActionSheet(vc:UIViewController) {
        currentVC = vc
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction) -> Void in
            self.camera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo", style: .default, handler: { (alert:UIAlertAction) -> Void in
            self.photoLibrary()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        vc.present(actionSheet, animated: true, completion: nil)
    }
}

//扩展
extension CameraHandler: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC.dismiss(animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage as!String] as? UIImage {
            self.imagePickedBlock?(image)
        } else {
            print("something went wrong")
        }
        currentVC.dismiss(animated: true, completion: nil)
    }
}
