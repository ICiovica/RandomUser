//
//  UsersProvider.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import Foundation

struct UsersProvider {
    func fetchUsers() async {
        let apiRequest = APIRequest()
        
        do {
            let result = try await apiRequest.getUsers()
            switch result {
            case .success(let response):
                print("Users: \(response.results)")
            case .failure(let error):
                print("Error: \(error)")
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
