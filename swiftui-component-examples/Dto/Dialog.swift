//
//  Dialog.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import Foundation

struct Dialog {
    
    internal init() {
        self.id = 1
        self.creationDate = ""
        self.lastMessageID = 1
        self.lastMessage = Message()
    }
    
    let id: Int
    var creationDate: String
    var lastMessageID: Int
    var lastMessage: Message
}
