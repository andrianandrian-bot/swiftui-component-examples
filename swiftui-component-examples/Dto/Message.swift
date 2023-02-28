//
//  Message.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import Foundation

struct Message: Identifiable, Equatable {
    internal init() {
        self.id = 1
        self.creationDate = ""
        self.text = ""
        self.userAuthorID = 1
        self.dialogID = 1
        self.userAuthor = User()
    }
    
    let id: Int
    var creationDate: String
    var text: String
    var userAuthorID: Int
    var dialogID: Int
    var userAuthor: User
}
