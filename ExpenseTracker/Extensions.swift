//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Dishant Nagpal on 29/04/22.
//

import Foundation
import SwiftUI

extension Color{
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}


extension DateFormatter{
     
    static let allNumbericIndia:DateFormatter = {
        let formatter =  DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}


extension String{
    
    func dateParsed()->Date{
        
        guard let parsedDate = DateFormatter.allNumbericIndia.date(from: self) else {
            return Date()
        }
        return parsedDate
    }
}


extension Date:Strideable{
    func formatted() -> String {
        
        return self.formatted(.dateTime.year().month().day())
        
    }
}

extension Double{
     
    func roundedto2Digits() -> Double {
        return (self*100).rounded() / 100
    }
}
