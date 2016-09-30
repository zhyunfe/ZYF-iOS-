//
//  MyCell.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/29.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var iView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var number: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
