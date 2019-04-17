//
//  QuoteTypeTableViewCell.swift
//  iHealthS
//
//  Created by Apple on 2019/4/12.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit

class QuoteTypeTableViewCell: UITableViewCell {
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        label.text = "Loading"
        label.textColor = UIColor(red: 0x1d/255.0, green: 0x90/255.0, blue: 0x7e/255.0, alpha: 1.0)
        label.textAlignment = .center
        label.layer.cornerRadius = 14
        label.clipsToBounds = true
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        label.heightAnchor.constraint(equalToConstant: 28).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        label.backgroundColor = UIColor(red: 0xc8/255.0, green: 0xeb/255.0, blue: 0xe6/255.0, alpha: 1.0)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
