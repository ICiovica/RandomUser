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
    let image: String
    
    var isFavorite: Bool = false
    
    init(name: String = "", email: String = "", registration: String = "", image: String = "") {
        self.name = name
        self.email = email
        self.registration = registration
        self.image = image
    }
}
