//
//  ContentView.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button {
                Task {
                    await UsersProvider().fetchUsers()
                }
            } label: {
                Text("Fetch Users")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
