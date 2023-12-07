//
//  UserDTO.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import Foundation

// MARK: - Response
struct Response: Codable, Sendable {
    let results: [User]
    let info: Info
}

// MARK: - Info
struct Info: Codable, Sendable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - User
struct User: Codable, Sendable {
    let gender: Gender
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

// MARK: - Dob
struct Dob: Codable, Sendable {
    let date: String
    let age: Int
}

enum Gender: String, Codable, Sendable {
    case female = "female"
    case male = "male"
}

// MARK: - ID
struct ID: Codable, Sendable {
    let name: String
    let value: String?
}

// MARK: - Location
struct Location: Codable, Sendable {
    let street: Street
    let city, state, country: String
    let postcode: Postcode
    let coordinates: Coordinates
    let timezone: Timezone
}

// MARK: - Coordinates
struct Coordinates: Codable, Sendable {
    let latitude, longitude: String
}

enum Postcode: Codable, Sendable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Postcode"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Street
struct Street: Codable, Sendable {
    let number: Int
    let name: String
}

// MARK: - Timezone
struct Timezone: Codable, Sendable {
    let offset, description: String
}

// MARK: - Login
struct Login: Codable, Sendable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct Name: Codable, Sendable {
    let title: Title
    let first, last: String
}

enum Title: String, Codable, Sendable {
    case miss = "Miss"
    case mr = "Mr"
    case mrs = "Mrs"
    case ms = "Ms"
}

// MARK: - Picture
struct Picture: Codable, Sendable {
    let large, medium, thumbnail: String
}
