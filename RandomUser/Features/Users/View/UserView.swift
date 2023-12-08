//
//  UserView.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import SwiftUI

struct UserView: View {
    let user: UserModel
    let action: (UserModel) -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            imageVw
            nameAndEmailVw
            Spacer()
            timeAndStarVw
        }
    }
}

// MARK: - Views
private extension UserView {
    var imageVw: some View {
        AsyncImageCache(url: user.imageURL, placeholderInitials: user.name.first?.description) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UserConstants.imageFrame)
                .clipShape(Circle())
        }
    }
    
    var nameAndEmailVw: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(user.name)
                .font(.system(.body, design: .rounded, weight: .medium))
            Text(user.email)
                .font(.system(.callout, design: .rounded, weight: .medium))
                .foregroundStyle(.black.opacity(0.75))
        }
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
    
    var timeAndStarVw: some View {
        VStack(spacing: 8) {
            Text(user.registration)
                .font(.system(.footnote, design: .rounded, weight: .medium))
                .foregroundStyle(.black.opacity(0.5))
            starBtnView
        }
    }
    
    var starBtnView: some View {
        Button {
            withAnimation {
                action(user)
            }
        } label: {
            Image(systemName: user.isFavorite ? "star.fill" : "star")
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundStyle(user.isFavorite ? .yellowApp : .black.opacity(0.5))
        }
        
    }
}

#Preview {
    UserView(user: UserModel(
        name: "John Doe",
        email: "john.doe@gmail.com",
        registration: "02:14",
        imageURL: nil)
    ) {_ in}
}
