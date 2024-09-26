//
//  ModelHistories.swift
//  WaterDr
//
//  Created by ngr on 26/09/24.
//

import Foundation

class ModelHistories {
    var typeOfDrink: TypeOfDrink?
    var createdAt: Date?
    var amount: Decimal?
    
    init(typeOfDrink: TypeOfDrink? = nil, createdAt: Date? = nil, amount: Decimal? = nil) {
        self.typeOfDrink = typeOfDrink
        self.createdAt = createdAt
        self.amount = amount
    }
}
