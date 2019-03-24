//
//  xxTabBarViewController.swift
//  xx1.0
//
//  Created by 小嘉仪 on 2019/1/30.
//  Copyright © 2019 小嘉仪. All rights reserved.
//

import UIKit

class xxTabBarViewController: MCTabBarController,MCTarBarControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //选中时的颜色
//        mcTabBar.tintColor = UIColor(red: 251.0/255.0, green: 199.0/255.0, blue: 115.0/255.0, alpha: 1)
        //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
        mcTabBar.isTranslucent = false
        mcTabBar.positon = .bulge
        mcTabBar.centerImage = UIImage(named: "添加按钮_1")!
        self.mcDelegate = self
        addChildViewControllers()
    }
    
    //添加子控制器
    func addChildViewControllers() {
        //图片大小建议32*32
        addChildViewController(AccountViewController(), title: "", imageName: "account")
        addChildViewController(DetailViewController(), title: "", imageName: "detail")
        //中间这个不设置东西，只占位
        addChildViewController(AccountViewController(), title: "", imageName: "")
        addChildViewController(ChartViewController(), title: "", imageName: "chart")
        addChildViewController(SettingViewController(), title: "", imageName: "setting")
    }
    
    
    // 添加子vc
    func addChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        childController.title = title
        if imageName.count > 0{
            childController.tabBarItem.image = UIImage(named: imageName)
            
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 5,left: 0,bottom: -8,right: 0)
            childController.tabBarItem.selectedImage = UIImage(named:  imageName + "_selected" )
            self.tabBar.tintColor = UIColor.black
            
        }
        let nav = xxNavigationController(rootViewController: childController)
        addChild(nav)
    }
    
    func mcTabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == 2 {
//            rotationAnimation()
            //使用打开相册和相机
            CameraHandler.shared.showActionSheet(vc: self)
            CameraHandler.shared.imagePickedBlock = {(image) in
                self.imageView.image = image
            }
        }else {
            removeAnimation()
        }
    }
    
//    // 旋转动画
//    func rotationAnimation() {
//        if "key" == self.mcTabBar.centerBtn.layer.animationKeys()?.first {
//            return
//        }
//        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
//        animation.toValue = NSNumber(value: Double.pi*2.0)
//        animation.duration = 3.0
//        animation.repeatCount = HUGE
//        self.mcTabBar.centerBtn.layer.add(animation, forKey: "key")
//    }
//
    func removeAnimation() {
        self.mcTabBar.centerBtn.layer.removeAllAnimations()
    }
}
