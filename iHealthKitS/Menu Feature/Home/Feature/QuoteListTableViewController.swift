//
//  QuoteListTableViewController.swift
//  iHealthS
//
//  Created by Apple on 2019/4/12.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit
import Alamofire

class QuoteListTableViewController: UITableViewController {
    var key = ""
    var contentList: [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = String(format: "http://47.75.131.189/8cb00f4f1c5df0cba033c69ee7a10fec/?type=content&key=%@", key)
        
        let imageView = UIImageView(image: UIImage(named: "say_2016x2688_back"))
        tableView.backgroundView = imageView
        
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let json = response.result.value as? [String: Any] {
                    for i in json["data"] as! [[String: String]] {
                        self.contentList.append(i["content"]!)
                    }
                }
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        }
        tableView.allowsSelection = false
        tableView.register(UINib(nibName: "QuoteListTableViewCell", bundle: nil), forCellReuseIdentifier: "QuoteListTableViewCell")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contentList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteListTableViewCell", for: indexPath) as! QuoteListTableViewCell
        let row = indexPath.row
        cell.label.text = contentList[row]
        
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 155
//    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
