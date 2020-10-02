//
//  CoffeeShopModel.swift
//  mvvmExample
//
//  Created by zoehor on 2020/9/30.
//

import UIKit

struct CoffeeData: Decodable {
    var name: String
}

class CoffeeShopModel: NSObject {
    
    var shopName:[String]=[]

    func jsonParsing(completion: @escaping (_ shopName: [String]) ->()){
        
        let address = "https://cafenomad.tw/api/v1.2/cafes/taipei"
        if let url = URL(string: address) {
            // GET
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let response = response as? HTTPURLResponse,let data = data {
                    print("Status code: \(response.statusCode)")
                    let decoder = JSONDecoder()
                    
                    if let coffeeData = try? decoder.decode([CoffeeData].self, from: data) {
                        DispatchQueue.main.async{
                            
                            for coffee in coffeeData {                   self.shopName.append(coffee.name)
                            }
                            
                            completion(self.shopName)
                
                        }
                    }
                }
            }.resume()
        } else {
            print("Invalid URL.")
        }
        
    }
}
