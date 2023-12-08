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
                    .task {
                        await vm.checkIfReachedUserShouldLoadNextPage(user)
                    }
            }
        }
        .listStyle(.plain)
        .overlay {
            if vm.isLoading { ProgressView() }
        }
        .alert(LocalizedStringKey(vm.fetchAlertModel.title),
               isPresented: $vm.fetchAlertModel.isPresented,
               actions: {
            Button("general_dismiss") {
                vm.handleFetchAlert()
            }
        },
               message: {
            Text(LocalizedStringKey(vm.fetchAlertModel.message))
        })
        .task {
            await vm.fetchUsers()
        }
    }
}

#Preview {
    UsersListVw()
}
