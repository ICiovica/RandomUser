//
//  UsersListVw.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import SwiftUI

struct UsersListVw: View {
    @StateObject private var vm = UsersViewModel()
    
    var body: some View {
        List {
            ForEach(vm.users, id: \.id) { user in
                UserView(user: user, action: vm.starIsTapped(_:))
            }
        }
        .listStyle(.plain)
        .task {
            await vm.fetchUsers()
        }
    }
}

#Preview {
    UsersListVw()
}
