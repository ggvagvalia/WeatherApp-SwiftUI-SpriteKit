//
//  DateFormater.swift
//  WeatherApp
//
//  Created by Bakar Kharabadze on 6/12/24.
//

import Foundation

struct DateFormater {
    static func formatTime(date: Date, timezoneOffset: Int? = nil) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        if let offset = timezoneOffset {
            let timezone = TimeZone(secondsFromGMT: offset)
            dateFormatter.timeZone = timezone
        }
        
        return dateFormatter.string(from: date)
    }
    
    static func isNightTime(timeString: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        if let date = dateFormatter.date(from: timeString) {
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            return (hour >= 21 || hour < 6)
        }
        
        return false
    }
    
    static func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, dd"
        return dateFormatter.string(from: date)
    }
    
    static func formatDay(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "EEEE"
            return dateFormatter.string(from: date)
        }
        return dateString
    }
}
