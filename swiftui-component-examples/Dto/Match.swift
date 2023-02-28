//
//  Match.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import Foundation

struct Match {
    internal init() {
        self.id = 1
        self.creationDate = ""
        self.dialogID = 1
        self.isActive = true
        self.dialog = Dialog()
    }
    
    
    
    let id: Int
    var creationDate: String
    var dialogID: Int?
    var isActive: Bool?
    var dialog: Dialog

}
