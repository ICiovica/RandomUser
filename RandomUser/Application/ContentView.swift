//
//  ContentView.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            topVw
            UsersListVw()
        }
    }
}

// MARK: - Views
private extension ContentView {
    var topVw: some View {
        titleVw.overlay { searchIconBtnVw }
            .background(Color.yellowApp)
    }
    
    var titleVw: some View {
        Text("users_title")
            .font(.system(.title3, design: .rounded, weight: .bold))
            .frame(maxWidth: .infinity, minHeight: 64)
    }
    
    var searchIconBtnVw: some View {
        Button {
            // mi-a fost mentionat ca nu trebuie implementat
        } label: {
            HStack {
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            .font(.system(.title3, design: .rounded, weight: .medium))
            .foregroundStyle(.black)
            .padding(.trailing)
        }
        .disabled(true)
    }
}

#Preview {
    ContentView()
}
