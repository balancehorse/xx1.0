//
//  AccountViewController.swift
//  xx1.0
//
//  Created by 小嘉仪 on 2019/1/29.
//  Copyright © 2019 小嘉仪. All rights reserved.
//

import UIKit
import Customkeyboard

class AccountViewController: UITableViewController{
    
    //剩余金额
    var leftNumber = 0
    //总金额
    var countMoney = 0
    
    //取账本信息
    var dicFromPList1:NSDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic1.plist")
    var dicFromPList2:NSDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic2.plist")
    var dicFromPList3:NSDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic3.plist")
    var dicFromPList4:NSDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic4.plist")
    var dicFromPList5:NSDictionary? = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic5.plist")

    var leftOfMonth:UILabel?
    var tableView1:UITableView?
    //测试用账本
    
    var books = [String]()

    //账本剩余金额
    var moneyID = [Int]()
    
    //图片名称
    var imgName = [String]()
    
    let Swidth = UIScreen.main.applicationFrame.size.width
    

    @objc func rightClick()->Void {
        //实例化一个将要跳转的viewController
        let addBook = addBooksViewController()
        //跳转
        self.navigationController?.pushViewController(addBook , animated: true)
        
    }
    func readDic() -> Void {
        //取账本信息
        dicFromPList1 = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic1.plist")
        dicFromPList2 = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic2.plist")
        dicFromPList3 = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic3.plist")
        dicFromPList4 = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic4.plist")
        dicFromPList5 = NSDictionary(contentsOfFile: "/Users/balancehorse/Desktop/xx1.0/xx1.0/dic5.plist")
        books = [String]()
        moneyID = [Int]()
        imgName = [String]()
        countMoney = 0
        leftNumber = 0
        
        
        if (dicFromPList1?["预设金额"] as! Int != -1)  {
            books.append(dicFromPList1?["账本名"] as! String)
            moneyID.append(dicFromPList1?["剩余金额"] as! Int)
            imgName.append(dicFromPList1?["图标名"] as! String)
            countMoney += dicFromPList1?["预设金额"] as! Int
            leftNumber += dicFromPList1?["剩余金额"] as! Int
            
        }
        if(dicFromPList2?["预设金额"] as! Int != -1)
        {
            books.append(dicFromPList2?["账本名"] as! String)
            moneyID.append(dicFromPList2?["剩余金额"] as! Int)
            imgName.append(dicFromPList2?["图标名"] as! String)
            countMoney += dicFromPList2?["预设金额"] as! Int
            leftNumber += dicFromPList2?["剩余金额"] as! Int
        }
        if (dicFromPList3?["预设金额"] as! Int != -1){
            books.append(dicFromPList3?["账本名"] as! String)
            moneyID.append(dicFromPList3?["剩余金额"] as! Int)
            imgName.append(dicFromPList3?["图标名"] as! String)
            countMoney += dicFromPList3?["预设金额"] as! Int
            leftNumber += dicFromPList3?["剩余金额"] as! Int
        }
        if (dicFromPList4?["预设金额"] as! Int != -1){
            books.append(dicFromPList4?["账本名"] as! String)
            moneyID.append(dicFromPList4?["剩余金额"] as! Int)
            imgName.append(dicFromPList4?["图标名"] as! String)
            countMoney += dicFromPList4?["预设金额"] as! Int
            leftNumber += dicFromPList4?["剩余金额"] as! Int
        }
        if (dicFromPList5?["预设金额"] as! Int != -1){
            //        if (dicFromPList5?["账本名"]  != nil){
            books.append(dicFromPList5?["账本名"] as! String)
            moneyID.append(dicFromPList5?["剩余金额"] as! Int)
            imgName.append(dicFromPList5?["图标名"] as! String)
            countMoney += dicFromPList5?["预设金额"] as! Int
            leftNumber += dicFromPList5?["剩余金额"] as! Int
        }
    }
    override func viewWillAppear(_ animated: Bool) {

        
       
        readDic()
        //设置navigation的titile
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        // 自定义view设置title
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:40, height:40))
        titleLabel.text = "记账"
        titleLabel.textColor = UIColor.black
        self.navigationItem.titleView = titleLabel
        
        //设置左右两边的按钮
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"编辑按钮"), style: .plain, target: self, action: #selector(self.leftClick))
        self.navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = UIColor.gray
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"增加"), style: .plain, target: self, action: #selector(self.rightClick))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.gray
        
        
        
        //tableView
        tableView1 = UITableView(frame: view.bounds, style: .grouped)
        tableView1!.backgroundColor = UIColor.white;
        //去掉没有数据显示部分多余的分隔线
        tableView1!.tableFooterView =  UIView.init(frame: CGRect.zero)
        //将分隔线offset设为零，即将分割线拉满屏幕
        tableView1!.separatorInset = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 0)
        
        //设置分隔线颜色
        tableView1!.separatorColor = UIColor.gray
        view.addSubview(tableView1!)
        tableView1!.dataSource = self
        tableView1!.delegate = self
        
        //table页眉
        let backgroundView = UIView.init()
        backgroundView.frame = CGRect(x: 0, y: 0, width: Swidth, height: 40)
        backgroundView.backgroundColor = UIColor.init(red: 237/255.0, green: 237/255.0, blue: 237/255.0, alpha: 1)
        view.addSubview(backgroundView)
        //给table添加页眉
        tableView.tableHeaderView = backgroundView
        
        //不加载没有内容的cell
        self.tableView.tableFooterView = UIView()
        
        let bgImage = UIImageView()
        bgImage.frame = CGRect(x: 0, y:10, width: Swidth, height: 600)
        bgImage.image = UIImage(named: "熊")
        bgImage.contentMode = .scaleAspectFit
        view.addSubview(bgImage)
        leftOfMonth = UILabel.init(frame: CGRect(x: 2, y: -7, width: Swidth, height: 40))
        //创建进度条
        loadingPressView()
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    //创建进度条
    func loadingPressView() -> Void {
        //创建页眉文字
        
        
        leftOfMonth?.text = "本月剩余:  " + String(leftNumber)
        leftOfMonth?.font = UIFont.systemFont(ofSize: 13)
        leftOfMonth?.textColor = UIColor.gray
        view.addSubview(leftOfMonth!)
        
      
        let balance = UIProgressView(progressViewStyle: .default)
        balance.frame = CGRect(x: 0, y: 0, width: Swidth / 1.10, height: 10)
        balance.layer.position = CGPoint(x: Swidth/2, y: 27)
        balance.progress = Float(leftNumber)/Float(countMoney)
        balance.progressTintColor = UIColor.init(red: 34/255.0, green: 162/255.0, blue: 221/255.0, alpha: 1) //进度颜色
        balance.trackTintColor = UIColor.init(red: 184/255.0, green: 184/255.0, blue: 173/255.0, alpha: 1) //剩余进度颜色
        balance.transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
        view.addSubview(balance)
    }
    //MARK: UITableViewDataSource
    // cell的个数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return books.count
    }
    // UITableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell==nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }

        cell?.textLabel?.text = books[indexPath.row]
        cell?.detailTextLabel?.text = "¥  " + String(moneyID[indexPath.row])
        cell?.imageView?.image = UIImage(named: imgName[indexPath.row])
        cell?.imageView?.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        cell?.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        return cell!
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: animated)
        tableView1!.setEditing(editing, animated: true)
    }
    //设置点击删除之后的操作
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        readDic()
        if tableView1?.cellForRow(at: indexPath)?.textLabel?.text == dicFromPList1!["账本名"] as? String{
                dicFromPList1?.setValue("", forKeyPath: "账本名")
                dicFromPList1?.setValue( -1, forKeyPath: "预设金额")
                dicFromPList1?.setValue(0, forKeyPath: "剩余金额")
                dicFromPList1?.setValue(false, forKeyPath: "是否为默认账本")
                dicFromPList1?.setValue("", forKeyPath: "图标名")
                dicFromPList1?.setValue(123, forKeyPath: "颜色代码")
                dicFromPList1!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic1.plist" , atomically: true)
        }
        if tableView1?.cellForRow(at: indexPath)?.textLabel?.text == dicFromPList2!["账本名"] as? String{
            dicFromPList2?.setValue("", forKeyPath: "账本名")
            dicFromPList2?.setValue( -1, forKeyPath: "预设金额")
            dicFromPList2?.setValue(0, forKeyPath: "剩余金额")
            dicFromPList2?.setValue(false, forKeyPath: "是否为默认账本")
            dicFromPList2?.setValue("", forKeyPath: "图标名")
            dicFromPList2?.setValue(123, forKeyPath: "颜色代码")
            dicFromPList2!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic2.plist" , atomically: true)
        }
        if tableView1?.cellForRow(at: indexPath)?.textLabel?.text == dicFromPList3!["账本名"] as? String{
            dicFromPList3?.setValue("", forKeyPath: "账本名")
            dicFromPList3?.setValue( -1, forKeyPath: "预设金额")
            dicFromPList3?.setValue(0, forKeyPath: "剩余金额")
            dicFromPList3?.setValue(false, forKeyPath: "是否为默认账本")
            dicFromPList3?.setValue("", forKeyPath: "图标名")
            dicFromPList3?.setValue(123, forKeyPath: "颜色代码")
            dicFromPList3!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic3.plist" , atomically: true)
        }
        if tableView1?.cellForRow(at: indexPath)?.textLabel?.text == dicFromPList4!["账本名"] as? String{
            dicFromPList4?.setValue("", forKeyPath: "账本名")
            dicFromPList4?.setValue( -1, forKeyPath: "预设金额")
            dicFromPList4?.setValue(0, forKeyPath: "剩余金额")
            dicFromPList4?.setValue(false, forKeyPath: "是否为默认账本")
            dicFromPList4?.setValue("", forKeyPath: "图标名")
            dicFromPList4?.setValue(123, forKeyPath: "颜色代码")
            dicFromPList4!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic4.plist" , atomically: true)
        }
        if tableView1?.cellForRow(at: indexPath)?.textLabel?.text == dicFromPList5!["账本名"] as? String{
            dicFromPList5?.setValue("", forKeyPath: "账本名")
            dicFromPList5?.setValue( -1, forKeyPath: "预设金额")
            dicFromPList5?.setValue(0, forKeyPath: "剩余金额")
            dicFromPList5?.setValue(false, forKeyPath: "是否为默认账本")
            dicFromPList5?.setValue("", forKeyPath: "图标名")
            dicFromPList5?.setValue(123, forKeyPath: "颜色代码")
            dicFromPList5!.write(toFile:"/Users/balancehorse/Desktop/xx1.0/xx1.0/dic5.plist" , atomically: true)
        }
        
        readDic()
        loadingPressView()
        
        tableView1!.deleteRows(at: [indexPath], with: .fade)
        tableView1!.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .fade)

    }
    
    
    
    //MARK: UITableViewDelegate
    // 设置cell高度
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    // 选中cell后执行此方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        example()
        
    }
    
    /// 例子
    private func example() {
        /// 文本框
        let textField = UITextField(frame: CGRect(x: 100, y: 120, width: 200, height: 35))
        textField.borderStyle = .roundedRect
        view.addSubview(textField)


        let keyboard = CustomKeyboard(view, field: textField)
        keyboard.style = .keyboard
        keyboard.isEnableKeyboard = true
        keyboard.whetherHighlight = true
        keyboard.frame.size.height = 300
        /// 淡蓝色
        let lightBlue = UIColor(red:0.45, green:0.69, blue:0.95, alpha:1.00)
        keyboard.customDoneButton(title: "确定", titleColor: .white, theme: lightBlue, target: self, callback: nil)
        textField.becomeFirstResponder()
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


