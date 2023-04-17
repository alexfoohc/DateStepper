//
//  DateManager.swift
//  DateStepper
//
//  Created by Alejandro Hernandez on 16/04/23.
//

import Foundation

enum DateFormat: String {
    case month = "MMMM yyyy"
    case year = "yyyy"
}

class DateManager {
    
    // TODO: Refactor whole logic, get functions to get current month and use calendar.date(byAdding:) to perform calculations in buttons
    let date = Date()
    let dateFormatter = DateFormatter()
    let calendar = Calendar.current
    
    
    
    private func returnDateWith(dateFormat: DateFormat, date: Date) -> String {
        dateFormatter.dateFormat = dateFormat.rawValue
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    private func returnDateWith(dateStyle: DateFormatter.Style) -> String {
        dateFormatter.dateStyle = dateStyle
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    
    // Add a function to retrieve the current month (Used when the view is loaded initially or by default)
    func getCurrentMonthString() -> String {
        returnDateWith(dateFormat: .month, date: date)
    }
    
    // Add a function to retrieve the current state for the month variable if it has been changed and return Date
    func getActualMonthValueFrom(date: Date) -> Date {
        return date
    }
    // Add a function to return date in String
    
    
    
    
    
    
//    func addMonth(actualMonth: Calendar.Component) -> String {
//        
//    }
}
