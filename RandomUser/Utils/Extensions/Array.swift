//
//  Array.swift
//  RandomUser
//
//  Created by IonutCiovica on 07/12/2023.
//

import Foundation

extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
