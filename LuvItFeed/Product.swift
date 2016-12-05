//
//  Product.swift
//  LuvItFeed
//
//  Created by Jose Manuel Perez on 12/4/16.
//  Copyright © 2016 LuvIT. All rights reserved.
//

import Foundation
import UIKit
class Product{
    var productId : String = ""
    var name : String =  ""
    var salePrice : NSDecimalNumber!
    var price : NSDecimalNumber!
    var stockStatus : String = ""
    var onSale : Bool = false
    var mainImage : UIImage!
    
    
    func Product(productId : String, name: String, salePrice : NSDecimalNumber, price: NSDecimalNumber,
                 stockStatus : String, onSale : Bool, mainImage : UIImage){
        self.productId = productId
        self.name = name
        self.salePrice = salePrice
        self.price = price
        self.stockStatus = stockStatus
        self.onSale = onSale
        self.mainImage = mainImage
    }
}