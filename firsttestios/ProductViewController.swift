//
//  ProductViewController.swift
//  firsttestios
//
//  Created by Anibal Francisco Correa on 28/6/17.
//  Copyright © 2017 Anibal Francisco Correa. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductTableViewCellDelegate {
    
    @IBOutlet private weak var productTableView: UITableView!
    @IBOutlet private weak var cantProductLabel: UILabel! {
        didSet {
            cantProductLabel.text = "Carrito: \(cantProduct)"
        }
    }
    @IBOutlet private weak var totalPriceShoppingLabel: UILabel! {
        didSet {
            totalPriceShoppingLabel.text = "Precio Total: $\(totalPrice)"
        }
    }
    
    private var cantProduct: Int = 0 {
        didSet {
            cantProductLabel.text = "Carrito: \(cantProduct)"
        }
    }
    
    private var totalPrice: Float = 0.0 {
        didSet {
            totalPriceShoppingLabel.text = "Precio Total: $\(totalPrice)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButtonNavigationBar()
    }
    
    private var productArray: [Product] = []
    
    
    func setProducts(_ products: [Product]) {
       productArray = products
    }
    
    private func createButtonNavigationBar() {
        let rigthButtonItem = UIBarButtonItem(title: "Carrito", style: .done, target: self, action: #selector(rigthButtonAction(sender:)))
        
        self.navigationItem.rightBarButtonItem = rigthButtonItem
    }
    
    @objc private func rigthButtonAction(sender: UIBarButtonItem) {
        print(sender)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as?
            ProductTableViewCell else {
                return UITableViewCell()
        }
        
        let product = productArray[indexPath.row]
        
        cell.fillData(titleText: product.name, descriptionProduct: product.description, imageProduct: product.image, priceProduct: product.price, stockProduct: product.stock)
        cell.delegate = self
        
        return cell
    }
    
    private func addDataProduct(productDetail: Product, cell: ProductTableViewCell) {
        guard !productDetail.isStock else {
            return
        }
        
        cantProduct += 1
        totalPrice += productDetail.price
        productDetail.substractStock(by: 1)
        cell.updateStock(newStock: productDetail.stock)
        
        
    }
    
    func productTableViewCell(buyActionFor cell: ProductTableViewCell) {
        guard let indexPath = productTableView.indexPath(for: cell) else { return }
        let product = productArray[indexPath.row]
        print(product)
        addDataProduct(productDetail: product, cell: cell)
    }
    
    
    
    
}
