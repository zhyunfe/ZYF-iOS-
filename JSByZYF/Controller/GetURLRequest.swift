//
//  GetURLRequest.swift
//  JSByZYF
//
//  Created by zhyunfe on 16/9/24.
//  Copyright © 2016年 zhyunfe. All rights reserved.
//

import UIKit

class GetURLRequest: NSObject {
    let urlString:String = ""
    var dataSource = [UsrModel]()
    var tb = UITableView()
    func getRequest() {
        let url = NSURL.init(string: urlString)
        let request  = NSURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, resp, error) in
            if error == nil {
                //请求数据成功，进行JSON解析
                let doc = try!NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                let arr = doc.objectForKey("data") as! NSArray

                for dic in arr {
                    let model = UsrModel()
                    model.setValuesForKeysWithDictionary(dic as! [String :AnyObject])
                    self.dataSource.append(model)
                }

            }
            self.tb.reloadData()
        }
        task.resume()
    }
}

