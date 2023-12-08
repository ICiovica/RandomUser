//
//  PreloadModel.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import Foundation

struct PreloadModel {
    var currentPage: Int = 0
    let totalPageCount: Int = 3
    let maxCount: Int = 3
    
    var isActive: Bool {
        currentPage < totalPageCount
    }
}
