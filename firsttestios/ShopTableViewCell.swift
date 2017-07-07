//
//  ShopViewTableViewCell.swift
//  firsttestios
//
//  Created by Anibal Francisco Correa on 6/7/17.
//  Copyright © 2017 Anibal Francisco Correa. All rights reserved.
//

import Foundation
import UIKit

protocol ShopTableViewCellDelegate: class {
    func shopTableViewCell(removeActionFor cell: ShopTableViewCell)
}

class ShopTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameProductLabel: UILabel!
    @IBOutlet private weak var cantShopCartLabel: UILabel!
    
    weak var delegate: ShopTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func fillData(nameProduct: String, cantProduct: Int) {
        nameProductLabel.text = "Producto: \(nameProduct)"
        cantShopCartLabel.text = "Cantidad: \(cantProduct)"
    }

    @IBAction func removeProductAction(_ sender: UIButton) {
        delegate?.shopTableViewCell(removeActionFor: self)
    }
}
