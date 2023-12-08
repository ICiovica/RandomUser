//
//  String.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import Foundation

extension String {    
    func timestampFormattedToHoursAndMinutes() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH:mm"
            let formattedString = outputFormatter.string(from: date)
            return formattedString
        }
        return "N/A"
    }
}
