//
//  ModelHistories.swift
//  WaterDr
//
//  Created by ngr on 26/09/24.
//

import Foundation

class ModelHistories {
    var typeOfDrink: ModelTypeOfDrink?
    var createdAt: Date?
    var amount: Decimal?
    
    init(typeOfDrink: ModelTypeOfDrink? = nil, createdAt: Date? = nil, amount: Decimal? = nil) {
        self.typeOfDrink = typeOfDrink
        self.createdAt = createdAt
        self.amount = amount
    }
}
