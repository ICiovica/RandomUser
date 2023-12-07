//
//  UsersViewModel.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published private(set) var users: [UserModel] = []
    
    @MainActor func fetchUsers() async {
        let apiRequest = APIRequest()
        do {
            let result = try await apiRequest.getUsers()
            switch result {
            case .success(let response):
                let fetchedUsers = response.results.map({ mapUserModel(user: $0) })
                users.append(contentsOf: fetchedUsers)
            case .failure(let error):
                print("Error: \(error)")
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
    func starIsTapped(_ user: UserModel) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index].isFavorite.toggle()
        }
    }
}

private extension UsersViewModel {
    func mapUserModel(user: User) -> UserModel {
        UserModel(
            name: "\(user.name.first) \(user.name.last)",
            email: user.email,
            registration: convertTimestampToHoursAndMinutes(user.registered.date),
            image: user.picture.thumbnail
        )
    }
    
    func convertTimestampToHoursAndMinutes(_ timestamp: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = dateFormatter.date(from: timestamp) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH:mm"
            
            let formattedString = outputFormatter.string(from: date)
            return formattedString
        }
        return "N/A"
    }
}
