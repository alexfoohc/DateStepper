//
//  DateManager.swift
//  DateStepper
//
//  Created by Alejandro Hernandez on 16/04/23.
//

import Foundation

public enum CalculationType {
    case add
    case substract
}

enum DateFormat: String {
    case month = "MMMM yyyy"
    case year = "yyyy"
}

class DateManager {
        
    // Give format to date
    private func returnDateWith(dateFormat: DateFormat, date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    // Add a function to retrieve the current month (Used when the view is loaded initially or by default)
    func getCurrentMonthString(date: Date) -> String {
        returnDateWith(dateFormat: .month, date: date)
    }
    
    func calculateMonth(date: Date, calculation: CalculationType) -> Date {
        let nextMonth: Date
        if calculation == .add {
            nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: date) ?? date
        } else {
            nextMonth = Calendar.current.date(byAdding: .month, value: -1, to: date) ?? date
        }
        return nextMonth
    }
}
