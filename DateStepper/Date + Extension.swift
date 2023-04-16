//
//  Date + Extension.swift
//  DateStepper
//
//  Created by Alejandro Hernandez on 15/04/23.
//

import Foundation

enum DateFormat: String {
    case month = "MMMM yyyy"
    case year = "yyyy"
}

extension Date {
    
    func getCurrentMonth() -> String {
        returnDateWith(dateFormat: .month)
    }
    
    func showFullDate() -> String {
        let date = Date()
        let fullDateFormatter = DateFormatter()
        fullDateFormatter.dateStyle = .long
        let dateString = fullDateFormatter.string(from: date)
        return dateString
    }
    
    func showOnlyYear() -> String {
        returnDateWith(dateFormat: .year)
    }
    
    private func returnDateWith(dateFormat: DateFormat) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    private func returnDateWith(dateStyle: DateFormatter.Style) -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    private func returnComponent() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        guard let month = components.month else {
            return 0 
        }
        
       return month
    }
}
