//
//  UserModel.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import Foundation

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let email: String
    let registration: String
    let imageURL: URL?
    
    var isFavorite: Bool = false
    
    init(name: String, email: String, registration: String, imageURL: URL?) {
        self.name = name
        self.email = email
        self.registration = registration
        self.imageURL = imageURL
    }
    
    init(userDTO: User) {
        self.name = "\(userDTO.name.first) \(userDTO.name.last)"
        self.email = userDTO.email
        self.registration = userDTO.registered.date.timestampFormattedToHoursAndMinutes()
        self.imageURL = URL(string: userDTO.picture.thumbnail)
    }
}
