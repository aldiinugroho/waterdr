//
//  DateUtils.swift
//  WaterDr
//
//  Created by ngr on 27/09/24.
//

import Foundation

class DateUtils {
    static func dateToString(value: Date, format: String? = nil) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format ?? "dd-MM-yyyy"
        return dateFormatter.string(from: value)
    }
}
