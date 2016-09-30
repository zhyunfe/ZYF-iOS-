//
//  ZYF-Find-MyCell.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/24.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class ZYF_Find_MyCell: UITableViewCell {

    @IBOutlet weak var usrPhoto: UIImageView!
    @IBOutlet weak var usrName: UILabel!
    @IBOutlet weak var publishTime: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var album: UIButton!
    @IBOutlet weak var info: UILabel!

    var model = UsrModel() {
        didSet {
            let artUrl = NSURL(string: model.articleImage!)
            let usrPhotoUrl = NSURL(string: model.usrPhoto!)
            articleImage.sd_setImageWithURL(artUrl)
            usrPhoto.sd_setImageWithURL(usrPhotoUrl)
            usrName.text = model.usrName
            album.titleLabel?.text = model.album
            publishTime.text = model.publishTime
            articleTitle.text = model.articleTitle

            let height = model.articleTitle!.boundingRectWithSize(CGSizeMake(274, 10000), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(17)], context: nil).size.height
            //设置标题label的高度
            articleTitle.frame.size.height = height
            album.frame.origin.y = height + usrName.frame.size.height + usrName.frame.origin.y
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
