//
//  ImageCache.swift
//  RandomUser
//
//  Created by IonutCiovica on 08/12/2023.
//

import SwiftUI

@MainActor
final class ImageCache {
    static private var cache: [URL: Image] = [:]
    
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
