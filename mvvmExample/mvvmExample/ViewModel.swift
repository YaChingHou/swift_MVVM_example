//
//  ViewModel.swift
//  mvvmExample
//
//  Created by zoehor on 2020/9/30.
//

import UIKit

class ViewModel: NSObject {

    @IBOutlet var coffeeShop: CoffeeShopModel!
    
    
    var shopName:[String]? = []
    
    func jsonPasing(completion: @escaping () -> ()){
        coffeeShop.jsonParsing { shopName in
            self.shopName = shopName
            completion()
            
            
        }
    }
    
    func numberOfItemsInSection(section:Int) -> Int{
        return shopName?.count ?? 0
        
    }
    
    func titleForItemsIndexPath(indexPath: IndexPath) -> String{
        return shopName?[indexPath.row] ?? ""
    }
}
