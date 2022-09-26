//
//  RoundedCornersCollectionCell.swift
//  CompositionalWithOrthogonal
//
//  Created by Esraa Khaled   on 03/09/2022.
//

import UIKit

class PizzaCell: UICollectionViewCell {
    static let reuseIdentifier = "PizzaCell"

    @IBOutlet weak var pizzaImage: UIImageView!
    
    @IBOutlet weak var pizzaName: UILabel!
    
    @IBOutlet weak var pizzaPrice: UILabel!
    
    @IBOutlet weak var pizzaDesc: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
