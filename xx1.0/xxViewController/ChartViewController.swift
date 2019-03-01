//
//  ChartViewController.swift
//  xx1.0
//
//  Created by 小嘉仪 on 2019/1/29.
//  Copyright © 2019 小嘉仪. All rights reserved.
//

import UIKit

class ChartViewController: UIViewController {

    override func viewDidLoad() {
        //设置navigation的titile
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        // 自定义view设置title
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:40, height:40))
        titleLabel.text = "图表"
        titleLabel.textColor = UIColor.black
        self.navigationItem.titleView = titleLabel
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
