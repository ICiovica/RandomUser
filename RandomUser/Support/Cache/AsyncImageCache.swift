//
//  AsyncImageCache.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import SwiftUI

struct AsyncImageCache<Content>: View where Content: View {
    private let url: URL?
    private let userInitials: String?
    private let content: (Image) -> Content
    
    init(
        url: URL?,
        userInitials: String?,
        @ViewBuilder content: @escaping (Image) -> Content
    ) {
        self.url = url
        self.userInitials = userInitials
        self.content = content
    }
    
    var body: some View {
        if let url, let cached = ImageCache[url] {
            content(cached)
        } else {
            asyncImageBlock()
        }
    }
    
    @MainActor private func asyncImageBlock() -> some View {
        AsyncImage(url: url) { image in
            if let url {
                ImageCache[url] = image
            }
            return content(image)
        } placeholder: {
            ZStack {
                Circle()
                    .fill(.yellowApp)
                    .frame(width: 48, height: 48)
                Text(userInitials ?? "N/A")
                    .font(.system(.title3, design: .rounded, weight: .medium))
            }
        }
    }
}

#Preview {
    AsyncImageCache(url: UserModel().imageURL, userInitials: nil, content: { image in
        image
    })
}