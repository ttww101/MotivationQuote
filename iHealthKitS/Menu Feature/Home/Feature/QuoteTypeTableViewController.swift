//
//  QuoteTypeTableViewController.swift
//  iHealthS
//
//  Created by Apple on 2019/4/12.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit
import Alamofire



class QuoteTypeTableViewController: UITableViewController {
    var quoteList: [String] = []
    var keys: [String] = []
    var id = 1

    fileprivate func updateFooterView() {
        let footerView = UIView()
        //        footerView.backgroundColor = .red
        
        let imageName = String(format: "say_2016x2688_p%02zd", id)
        let image = UIImage(named: imageName)
        let imageView1 = UIImageView(image: image!)
        //        imageView1.backgroundColor = .red
        imageView1.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView1.center = CGPoint(x: view.center.x, y: imageView1.center.y)
        let rect1 = UIScreen.main.bounds
        footerView.frame = CGRect(x: 0, y: 0, width: 200, height: imageView1.frame.height)
        //        imageView1.backgroundColor = .blue
        footerView.addSubview(imageView1)
        
        tableView.tableFooterView = footerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = UIScreen.main.bounds
        let imageView = UIImageView(image: UIImage(named: "say_2016x2688_back"))
        tableView.backgroundView = imageView
        Alamofire.request("http://47.75.131.189/8cb00f4f1c5df0cba033c69ee7a10fec/?type=title").responseJSON { (response) in
            if response.result.isSuccess {
                if let json = response.result.value as? [String: Any] {
                    for i in json["data"] as! [[String: String]] {
                        self.quoteList.append(i["title"]!)
                        self.keys.append(i["key"]!)
                    }
                }
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        }
        
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(QuoteTypeTableViewCell.self, forCellReuseIdentifier: "QuoteTypeCell")
        
        updateFooterView()
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = indexPath.row + 1
        updateFooterView()
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = QuoteListTableViewController()
        vc.key = keys[indexPath.row]
        getNav().pushViewController(vc, animated: true)
        
    }
    
    func getNav() -> UINavigationController {
        let delegate = UIApplication.shared.delegate!
        let window = delegate.window!
        let rootVC = window?.rootViewController!
        let resideVC = rootVC! as! RESideMenu
        
        return resideVC.contentViewController! as! UINavigationController
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteTypeCell", for: indexPath) as! QuoteTypeTableViewCell
        cell.label.text = quoteList[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        return cell
    }



}
