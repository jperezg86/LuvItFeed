//
//  ViewController.swift
//  LuvItFeed
//
//  Created by Jose Manuel Perez on 12/1/16.
//  Copyright © 2016 LuvIT. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getFeed()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getFeed(){
        Alamofire.request(
            .POST,
            "http://luvit-exam.dpabkxfpxz.us-west-2.elasticbeanstalk.com/ios_exam/",
            parameters: ["page" : "1"],
            encoding: .URL)
            .validate().responseJSON { (response) -> Void in
                if let json = response.result.value {
                    print("JSON: \(json)")
                }
            }
    }

}

