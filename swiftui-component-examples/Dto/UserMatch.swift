//
//  UserMatch.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import Foundation

struct UserMatch: Equatable, Identifiable {
    
    internal init() {
        self.id = 1
        self.userID = 1
        self.matchID = 1
        self.unreadMessagesCount = 22
        self.userIDTarget = 1
        self.userTarget = User()
        self.isMarked = true
        self.isShown = true
        self.match = Match()
    }
    
    
    static func == (lhs: UserMatch, rhs: UserMatch) -> Bool {
        lhs.id == rhs.id && lhs.isShown == rhs.isShown && lhs.isMarked == rhs.isMarked
    }
    
    let id: Int
    var userID: Int
    var matchID: Int
    var unreadMessagesCount: Int?
    var userIDTarget: Int?
    var userTarget: User?
    var isMarked: Bool?
    var isShown: Bool?
    var match: Match?
}
