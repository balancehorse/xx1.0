//
//  AccountViewController.swift
//  xx1.0
//
//  Created by 小嘉仪 on 2019/1/29.
//  Copyright © 2019 小嘉仪. All rights reserved.
//

import UIKit

class AccountViewController: UITableViewController{
    
    //剩余金额
    var leftNumber = 0
    //总金额
    var countMoney = 0
    
    //字典形式
    var dic1 = ["账本名":"吃饭","预设金额":600,"剩余金额":300,"是否为默认账本":1,"图标名":"吃饭","颜色代码":123] as [String : Any?]
    var dic2 = ["账本名":"出行","预设金额":300,"剩余金额":100,"是否为默认账本":0,"图标名":"出行","颜色代码":123] as [String : Any?]
    var dic3 = ["账本名":"购物","预设金额":600,"剩余金额":500,"是否为默认账本":0,"图标名":"购物","颜色代码":123] as [String : Any?]
    var dic4 = ["账本名":"社交","预设金额":200,"剩余金额":100,"是否为默认账本":0,"图标名":"社交","颜色代码":123] as [String : Any?]
    var dic5 = ["账本名":nil,"预设金额":-1,"剩余金额":nil,"是否为默认账本":nil,"图标名":nil,"颜色代码":nil] as [String : Any?]

    //测试用账本
    
    var books = [String]()

    //账本剩余金额
    var moneyID = [Int]()
    
    //图片名称
    var imgName = [String]()
    
    let Swidth = UIScreen.main.applicationFrame.size.width
    
    @objc  func leftClick()->Void {
        
        print("leftClick")
        
    }
    
    @objc func rightClick()->Void {
        //实例化一个将要跳转的viewController
        let addBook = addBooksViewController()
        //跳转
        self.navigationController?.pushViewController(addBook , animated: true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置navigation的titile
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        // 自定义view设置title
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:40, height:40))
        titleLabel.text = "记账"
        titleLabel.textColor = UIColor.black
        self.navigationItem.titleView = titleLabel
        
        //设置左右两边的按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"编辑按钮"), style: .plain, target: self, action: #selector(self.leftClick))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.gray
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"增加"), style: .plain, target: self, action: #selector(self.rightClick))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.gray
        
      
     
        //tableView
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.white;
        //去掉没有数据显示部分多余的分隔线
        tableView.tableFooterView =  UIView.init(frame: CGRect.zero)
        //将分隔线offset设为零，即将分割线拉满屏幕
        tableView.separatorInset = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 0)
        
        //设置分隔线颜色
        tableView.separatorColor = UIColor.gray
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
       
        //table页眉
        let backgroundView = UIView.init()
        backgroundView.frame = CGRect(x: 0, y: 0, width: Swidth, height: 40)
        backgroundView.backgroundColor = UIColor.init(red: 237/255.0, green: 237/255.0, blue: 237/255.0, alpha: 1)
        view.addSubview(backgroundView)
        //给table添加页眉
        tableView.tableHeaderView = backgroundView
        
        //不加载没有内容的cell
        self.tableView.tableFooterView = UIView()
        
    
     
        
        if (dic1["账本名"] != nil)  {
            books.append(dic1["账本名"] as! String)
            moneyID.append(dic1["剩余金额"] as! Int)
            imgName.append(dic1["图标名"] as! String)
            countMoney += dic1["预设金额"] as! Int
            leftNumber += dic1["剩余金额"] as! Int
            
        }
        if(dic2["账本名"] != nil)
        {
            books.append(dic2["账本名"] as! String)
            moneyID.append(dic2["剩余金额"] as! Int)
            imgName.append(dic2["图标名"] as! String)
            countMoney += dic2["预设金额"] as! Int
            leftNumber += dic2["剩余金额"] as! Int
        }
        if (dic3["账本名"] != nil){
            books.append(dic3["账本名"] as! String)
            moneyID.append(dic3["剩余金额"] as! Int)
            imgName.append(dic3["图标名"] as! String)
            countMoney += dic3["预设金额"] as! Int
            leftNumber += dic3["剩余金额"] as! Int
        }
        if (dic4["账本名"] != nil){
            books.append(dic4["账本名"] as! String)
            moneyID.append(dic4["剩余金额"] as! Int)
            imgName.append(dic4["图标名"] as! String)
            countMoney += dic4["预设金额"] as! Int
            leftNumber += dic4["剩余金额"] as! Int
        }
        if (dic5["预设金额"] as! Int != -1){
            books.append(dic5["账本名"] as! String)
            moneyID.append(dic5["剩余金额"] as! Int)
            imgName.append(dic5["图标名"] as! String)
            countMoney += dic5["预设金额"] as! Int
            leftNumber += dic5["剩余金额"] as! Int
        }
        
        //创建页眉文字
        
        let leftOfMonth = UILabel.init(frame: CGRect(x: 2, y: -7, width: Swidth, height: 40))
        leftOfMonth.text = "本月剩余:  " + String(leftNumber)
        leftOfMonth.font = UIFont.systemFont(ofSize: 13)
        leftOfMonth.textColor = UIColor.gray
        view.addSubview(leftOfMonth)
        
        let bgImage = UIImageView()
        bgImage.frame = CGRect(x: 0, y:10, width: Swidth, height: 600)
        bgImage.image = UIImage(named: "熊")
        bgImage.contentMode = .scaleAspectFit
        view.addSubview(bgImage)
        
        //创建进度条
        loadingPressView()
        
    }
    
    //创建进度条
    func loadingPressView() -> Void {
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
    
  
    
    //MARK: UITableViewDelegate
    // 设置cell高度
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    // 选中cell后执行此方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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


