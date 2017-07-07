//
//  Product.swift
//  firsttestios
//
//  Created by Anibal Francisco Correa on 28/6/17.
//  Copyright © 2017 Anibal Francisco Correa. All rights reserved.
//

import Foundation
import UIKit

class Product {
    
    let name: String
    let description: String
    let price: Float
    let image: UIImage?
    var stock: Int
    var isStock: Bool {
        return stock == 0
    }
    
    init(name: String, description: String, price: Float, image: UIImage?, stock: Int) {
        self.name = name
        self.description = description
        self.price = price
        self.image = image
        self.stock = stock
    }
    
    func substractStock(by cant: Int) {
        guard (stock - cant) >= 0 else {return}
        
        stock -= cant
    }
    
    func addProductStock(by cant: Int) {
        stock += cant
    }
    
    

}
