//
//  ViewController.swift
//  LuvItFeed
//
//  Created by Jose Manuel Perez on 12/1/16.
//  Copyright © 2016 LuvIT. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let identifier = "cell"
    var items = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]

    @IBOutlet weak var collectionView: UICollectionView!

//    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
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
                    let chunks = json["chunk"] as? [AnyObject]
                    for item in chunks! {
//                        let itemDic = item as?[[String:AnyObject]]
                        print("=============")
                        print ((item["luv_flag"] as! Bool));
                        print("********************")
                    }
                    
                }
            }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.identifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        cell.myLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.cyanColor()
        
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Has seleccionado \(indexPath.item)!")
    }
}


class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
}

