//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-21.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
