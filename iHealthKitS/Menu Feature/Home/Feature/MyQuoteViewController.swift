//
//  MyQuoteViewController.swift
//  iHealthS
//
//  Created by Apple on 2019/4/12.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit

class MyQuoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = view.frame
        let myQuoteTableVC = MyQuoteTableViewController()
        myQuoteTableVC.view.frame = CGRect(x: rect.origin.x, y: rect.origin.y+80, width: rect.width-30, height: rect.height-120)
        addChild(myQuoteTableVC)
        view.addSubview(myQuoteTableVC.view)
        myQuoteTableVC.didMove(toParent: self)
        
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
