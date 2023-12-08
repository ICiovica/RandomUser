//
//  UsersViewModel.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published private(set) var users: [UserModel] = []
    private var preloadModel = PreloadModel()
    @Published var fetchAlertModel = FetchAlertModel()
    
    @MainActor func fetchUsers() async {
        do {
            let result = try await APIRequest().getUsers()
            switch result {
            case .success(let response):
                let fetchedUsers = response.results.map({ UserModel(userDTO: $0) })
                users.append(contentsOf: fetchedUsers)
                preloadModel.currentPage += 1
            case .failure(let error):
                handleFetchAlert()
                print("Error: \(error.localizedDescription)")
            }
        } catch {
            handleFetchAlert()
            print("Error: \(error.localizedDescription)")
        }
    }
    
    @MainActor func checkIfReachedUserShouldLoadNextPage(_ user: UserModel) async {
        if preloadModel.isActive,
           let reachedUser = users[safeIndex: users.count - preloadModel.maxCount],
           reachedUser.id == user.id {
            await fetchUsers()
        }
    }
    
    func starIsTapped(_ user: UserModel) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index].isFavorite.toggle()
        }
    }
    
    func handleFetchAlert() {
        fetchAlertModel.isPresented.toggle()
    }
}
