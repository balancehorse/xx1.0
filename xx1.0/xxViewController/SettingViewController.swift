//
//  SettingViewController.swift
//  xx1.0
//
//  Created by 小嘉仪 on 2019/1/29.
//  Copyright © 2019 小嘉仪. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {

    //cell内容
    let section1 = ["分享给朋友"]
    let section2 = ["升级至专业版"]
    let section3 = ["引导","主题","iCloud"]
    let section4 = ["评分","反馈","关于我们"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置navigation的titile
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        // 自定义view设置title
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:40, height:40))
        titleLabel.text = "设置"
        titleLabel.textColor = UIColor.black
        self.navigationItem.titleView = titleLabel
        
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.lightGray;
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = 5
        tableView.sectionFooterHeight = 5
        tableView.backgroundColor = UIColor.init(red: 237/255.0, green: 237/255.0, blue: 237/255.0, alpha: 1)
        
        let backgroundView = UIView.init()
        let Swidth = UIScreen.main.applicationFrame.size.width
        backgroundView.frame = CGRect(x: 0, y: 0, width: Swidth, height: 10)
        backgroundView.backgroundColor = UIColor.init(red: 237/255.0, green: 237/255.0, blue: 237/255.0, alpha: 1)
        backgroundView.alpha = 0.25
        view.addSubview(backgroundView)
        //给table添加页眉
        tableView.tableHeaderView = backgroundView
        //不加载没有内容的cell
        self.tableView.tableFooterView = UIView()
        
       
    }
    
    //MARK: UITableViewDataSource
    
    //章节的个数
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 4
    }
    
    // cell的个数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        { return 1 }
        else if section == 1
        { return 1 }
        else if section == 2
        { return 3 }
        else
        { return 3 }

        
    }
    
    
    // UITableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell==nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellid)
        }
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        if indexPath.section == 0{
        cell?.textLabel?.text = "分享给朋友"
        }else if indexPath.section == 1{
            cell?.textLabel?.text = "升级至专业版"
        }else if indexPath.section == 2{
            cell?.textLabel?.text = section3[indexPath.row]
            if indexPath.row == 2{
                let switchBtn = UISwitch.init(frame: CGRect(x: 0, y: 0, width: 18, height: 40))
                cell?.accessoryView = switchBtn
                switchBtn.addTarget(self,action: #selector(switchStateDidChange(_:)), for: .valueChanged)
            }
        }else{
            cell?.textLabel?.text = section4[indexPath.row]
        }
  
        return cell!
    }
    
    //MARK: UITableViewDelegate
    // 设置cell高度
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    // 选中cell后执行此方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    //开关回调事件，注意“_”下划线与sender之间要有空格
    @objc func switchStateDidChange(_ sender : UISwitch){
        if(sender.isOn == true){
            print("UISwitch state is ON")
            
        }else{
            print("UISwitch state is OFF")
        }
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


