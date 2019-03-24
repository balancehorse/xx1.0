//
//  addBooksViewController.swift
//  xx1.0
//
//  Created by majunheng on 2019/3/1.
//  Copyright © 2019 小嘉仪. All rights reserved.
//

import UIKit

class addBooksViewController: UITableViewController {

    let titleOfCell = ["账本","预设金额","图标","颜色","拍照默认账本"]
    //取账本信息
    let dicFromPList1:NSMutableDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic1.plist") as? NSMutableDictionary
    let dicFromPList2:NSMutableDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic2.plist") as? NSMutableDictionary
    let dicFromPList3:NSMutableDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic3.plist") as? NSMutableDictionary
    let dicFromPList4:NSMutableDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic4.plist") as? NSMutableDictionary
    let dicFromPList5:NSMutableDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic5.plist") as? NSMutableDictionary

    var NewNameOfBook:String = "111"
    var NewMoney = -1
    var NewIcon = "社交_red"
    var LeftMoney = 0
    var Ifpremier:Bool = false

   @objc  func leftClick()->Void {
        
    //方式一：跳转到前一个页面
    self.navigationController?.popViewController(animated: true)

    }
    
    @objc func rightClick()->Void {
        
        if (dicFromPList1?["预设金额"] as! Int == -1)  {
          
            dicFromPList1?.setValue(NewNameOfBook, forKeyPath: "账本名")
            dicFromPList1?.setValue(NewMoney , forKeyPath: "预设金额")
            dicFromPList1?.setValue(LeftMoney, forKeyPath: "剩余金额")
            dicFromPList1?.setValue(Ifpremier, forKeyPath: "是否为默认账本")
            dicFromPList1?.setValue(NewIcon, forKeyPath: "图标名")
            dicFromPList1?.setValue(123, forKeyPath: "颜色代码")
            dicFromPList1!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic1.plist" , atomically: true)
            self.navigationController?.popViewController(animated: true)
        }
        if(dicFromPList2?["预设金额"] as! Int == -1)
        {
            dicFromPList2?.setValue(NewNameOfBook, forKeyPath: "账本名")
            dicFromPList2?.setValue(NewMoney , forKeyPath: "预设金额")
            dicFromPList2?.setValue(LeftMoney, forKeyPath: "剩余金额")
            dicFromPList2?.setValue(Ifpremier, forKeyPath: "是否为默认账本")
            dicFromPList2?.setValue(NewIcon, forKeyPath: "图标名")
            dicFromPList2?.setValue(123, forKeyPath: "颜色代码")
            dicFromPList2!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic2.plist" , atomically: true)
            self.navigationController?.popViewController(animated: true)
        }
        if (dicFromPList3?["预设金额"] as! Int == -1){
            dicFromPList3?.setValue(NewNameOfBook, forKeyPath: "账本名")
            dicFromPList3?.setValue(NewMoney , forKeyPath: "预设金额")
            dicFromPList3?.setValue(LeftMoney, forKeyPath: "剩余金额")
            dicFromPList3?.setValue(Ifpremier, forKeyPath: "是否为默认账本")
            dicFromPList3?.setValue(NewIcon, forKeyPath: "图标名")
            dicFromPList3?.setValue(123, forKeyPath: "颜色代码")
            dicFromPList3!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic3.plist" , atomically: true)
            self.navigationController?.popViewController(animated: true)
        }
        if (dicFromPList4?["预设金额"] as! Int == -1){
            dicFromPList4?.setValue(NewNameOfBook, forKeyPath: "账本名")
            dicFromPList4?.setValue(NewMoney , forKeyPath: "预设金额")
            dicFromPList4?.setValue(LeftMoney, forKeyPath: "剩余金额")
            dicFromPList4?.setValue(Ifpremier, forKeyPath: "是否为默认账本")
            dicFromPList4?.setValue(NewIcon, forKeyPath: "图标名")
            dicFromPList4?.setValue(123, forKeyPath: "颜色代码")
            dicFromPList4!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic4.plist" , atomically: true)
            self.navigationController?.popViewController(animated: true)
        }
  
        if (dicFromPList5?["预设金额"] as! Int == -1){
            
            dicFromPList5?.setValue(NewNameOfBook, forKeyPath: "账本名")
            dicFromPList5?.setValue(NewMoney , forKeyPath: "预设金额")
            dicFromPList5?.setValue(LeftMoney, forKeyPath: "剩余金额")
            dicFromPList5?.setValue(Ifpremier, forKeyPath: "是否为默认账本")
            dicFromPList5?.setValue(NewIcon, forKeyPath: "图标名")
            dicFromPList5?.setValue(123, forKeyPath: "颜色代码")
            dicFromPList5!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic5.plist" , atomically: true)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置navigation的titile
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        // 自定义view设置title
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:40, height:40))
        titleLabel.text = "添加账本"
        titleLabel.textColor = UIColor.black
        self.navigationItem.titleView = titleLabel
        
        //znavigation bar设置
        let leftButton = UIButton(frame: CGRect(x:0, y:0, width:40, height:40))
        let rightButton = UIButton(frame: CGRect(x:0, y:0, width:40, height:40))
        leftButton.setTitleColor(UIColor.black,for: UIControl.State.normal)
        rightButton.setTitleColor(UIColor.black,for: UIControl.State.normal)
        leftButton.setTitle("取消",for: UIControl.State.normal)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightButton.setTitle("确定",for: UIControl.State.normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        leftButton.addTarget(self, action: #selector(leftClick),for: UIControl.Event.touchUpInside)
        rightButton.addTarget(self, action: #selector(rightClick),for: UIControl.Event.touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
      
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
        


        // Do any additional setup after loading the view.
    }
    
    //章节的个数
    override func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    // cell的个数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
    }
    
    
    // UITableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell==nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellid)
        }
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        //提前预设view
        //预设cellview
        let nameOfBook = UITextField.init(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        let moneyOfBook = UITextField.init(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        let iconOfBook = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 26, height: 26))
        let colorOfBook = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 40, height: 18))
        let switchBtn = UISwitch.init(frame: CGRect(x: 0, y: 0, width: 18, height: 40))
        
        
        nameOfBook.addTarget(self, action: Selector(("textFieldDidChange1:")), for: .editingChanged)
        moneyOfBook.addTarget(self, action: Selector(("textFieldDidChange2:")), for: .editingChanged)
        nameOfBook.placeholder = "账本名"
        nameOfBook.font = UIFont.systemFont(ofSize: 14)
        nameOfBook.adjustsFontSizeToFitWidth=true
        nameOfBook.minimumFontSize=14
        nameOfBook.textAlignment = .right
        nameOfBook.keyboardType = UIKeyboardType.default
        
        
        moneyOfBook.placeholder = "预设金额"
        moneyOfBook.adjustsFontSizeToFitWidth=true
        moneyOfBook.minimumFontSize=12
        moneyOfBook.font = UIFont.systemFont(ofSize: 14)
        moneyOfBook.textAlignment = .right
        moneyOfBook.keyboardType = UIKeyboardType.numberPad
        
       
        iconOfBook.image = UIImage(named: "社交")
        
       
        colorOfBook.backgroundColor = UIColor.red
        colorOfBook.layer.cornerRadius = 6
       
        cell?.textLabel?.text = titleOfCell[indexPath.row]
       
        cell?.accessoryView = switchBtn
        if indexPath.row == 0 {
             cell?.accessoryView = nameOfBook
        }else if indexPath.row == 1
        {
             cell?.accessoryView = moneyOfBook
        }else if indexPath.row == 2
        {
             cell?.accessoryView = iconOfBook
        }else if indexPath.row == 3{
             cell?.accessoryView = colorOfBook
        }else {
            cell?.accessoryView = switchBtn
            switchBtn.addTarget(self,action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        }

        return cell!
    }
    
    //开关回调事件，注意“_”下划线与sender之间要有空格
    @objc func switchStateDidChange(_ sender : UISwitch){
        if(sender.isOn == true){
            Ifpremier = true
            print("设为默认账本")
            
        }else{
            Ifpremier = false
            print("取消默认账本")
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

    @objc func textFieldDidChange1(_ textField: UITextField) {
        NewNameOfBook = textField.text!
    }
    @objc func textFieldDidChange2(_ textField: UITextField) {
        NewMoney = Int(textField.text!)!
        LeftMoney = NewMoney
    }
}
