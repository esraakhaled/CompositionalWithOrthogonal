//
//  PizzaModel.swift
//  CompositionalWithOrthogonal
//
//  Created by Esraa Khaled   on 03/09/2022.
//

import UIKit

struct PizzaModel: Hashable,Equatable{
    //MARK: - Properties
    let id = UUID()
    let pizzaName: String
    let pizzaPrice: Double
    let pizzaImage: UIImage?
    let pizzaDesc: String
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
  static func ==(lhs: PizzaModel, rhs: PizzaModel) -> Bool {
        return lhs.id == rhs.id
   }
    init(pizzaName: String,pizzaPrice: Double,pizzaImage: UIImage? = nil,pizzaDesc: String){
        self.pizzaName = pizzaName
        self.pizzaPrice = pizzaPrice
        self.pizzaImage = pizzaImage
        self.pizzaDesc = pizzaDesc
    }
}
