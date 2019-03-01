//
//  AccountViewController.swift
//  xx1.0
//
//  Created by 小嘉仪 on 2019/1/29.
//  Copyright © 2019 小嘉仪. All rights reserved.
//

import UIKit

class AccountViewController: UITableViewController{

    //测试用账本
    var books = ["吃饭","出行","购物","社交"]
    
    //账本金额
    var moneyID = ["500","500","400","300"]
    
    //图片名称
    var imgName = ["吃饭","出行","购物","社交"]
    
    let Swidth = UIScreen.main.applicationFrame.size.width
    
    @objc  func leftClick()->Void {
        
        print("leftClick")
        
    }
    
    @objc func rightClick()->Void {
        
        print("rightClick")
        
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
        
        //创建页眉文字
        var leftNumber = 1230.0
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
        balance.progress = 0.75
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
        cell?.detailTextLabel?.text = "¥  " + moneyID[indexPath.row]
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


