//
//  UserDTO.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let results: [User]
}

// MARK: - User
struct User: Codable {
    let name: Name
    let email: String
    let registered: Dob
    let picture: Picture
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
}

// MARK: - Name
struct Name: Codable {
    let first: String
    let last: String
}

// MARK: - Picture
struct Picture: Codable {
    let thumbnail: String
}
