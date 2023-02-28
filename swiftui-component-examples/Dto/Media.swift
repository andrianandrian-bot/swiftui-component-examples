//
//  Media.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import Foundation

struct Media: Equatable {
    
    internal init() {
        self.id = 1
        self.userOwnerID = 1
        self.mediaPath = "mediaPath"
        self.creationDate = "creationDate"
    }
    
    let id: Int
    var userOwnerID: Int
    var mediaPath: String
    var creationDate: String
}
