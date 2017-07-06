//
//  ProductTableViewCell.swift
//  firsttestios
//
//  Created by Anibal Francisco Correa on 3/7/17.
//  Copyright © 2017 Anibal Francisco Correa. All rights reserved.
//

import UIKit

protocol ProductTableViewCellDelegate: class {
    func productTableViewCell(buyActionFor cell: ProductTableViewCell)
}


class ProductTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleProductLabel: UILabel!
    @IBOutlet private weak var descriptionProductLabel: UILabel!
    
    @IBOutlet private weak var priceProductLabel: UILabel!
    @IBOutlet private weak var stockProductLabel: UILabel!
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    
    @IBOutlet private weak var unavailable: UILabel!
    @IBOutlet private weak var thumbnailImageViewConstrain: NSLayoutConstraint!
    
    weak var delegate: ProductTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(titleText: String?, descriptionProduct: String?,imageProduct: UIImage? ,priceProduct: Float, stockProduct: Int) {
        
        titleProductLabel.text = titleText
        descriptionProductLabel.text = descriptionProduct
        thumbnailImageView.image = imageProduct
        priceProductLabel.text = "Precio: $\(priceProduct)"
        stockProductLabel.text = "Stock: \(stockProduct)"
        
    }
    
    func updateStock(newStock: Int) {
        stockProductLabel.text = "Stock: \(newStock)"
        
        let newHeigth = contentView.frame.size.height - unavailable.frame.origin.y + 2
        
        thumbnailImageViewConstrain.constant = newStock == 0 ? newHeigth : 2
        
        UIView.animate(withDuration: 0.2) {
            self.contentView.layoutIfNeeded()
        }
        
        unavailable.isHidden = newStock != 0
    }
    
    @IBAction func buyPorductAction(_ sender: Any) {
        delegate?.productTableViewCell(buyActionFor: self)
    }
    

}
