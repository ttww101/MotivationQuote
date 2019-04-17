//
//  QuoteListTableViewCell.swift
//  iHealthS
//
//  Created by Apple on 2019/4/12.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit

class QuoteListTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    weak var tableView: UITableView? {
        // 在 iOS 7 ~ 10 中 ，UITableViewCell 的 superview 為 UITableViewWrapperView 而不是 UITableView
        if #available(iOS 11, *) {
            return self.superview as? UITableView
        }else {
            return self.superview?.superview as? UITableView
        }
        
    }
    
    weak var viewController: UIViewController? {
        return self.tableView?.delegate as? UIViewController
    }
    
    
    @IBAction func clickCollect(_ sender: Any) {
        var myQuotes = UserDefaults.standard.stringArray(forKey: "myQuotes")
        if myQuotes == nil {
            myQuotes = []
        }
        myQuotes?.append(label.text!)
        UserDefaults.standard.set(myQuotes, forKey: "myQuotes")
        
        let alertController = UIAlertController(title: "已加入收藏", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "好", style: .default, handler: nil)
        alertController.addAction(alertAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func clickShare(_ sender: Any) {
        let activityViewController = UIActivityViewController(activityItems: [label.text], applicationActivities: nil)
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
