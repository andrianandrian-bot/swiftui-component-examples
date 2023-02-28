//
//  Recommendation.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import Foundation

enum RatingType: String {
    case like = "LIKE"
    case dislike = "DISLIKE"
}

struct Recommendation: Identifiable, Equatable {
    
    internal init() {
        self.id = 1
        self.creationDate = ""
        self.lastSeenTime = ""
        self.userRecommendedID = 1
        self.isShown = true
        self.userRecommended = User()
    }
    
    
    static func == (lhs: Recommendation, rhs: Recommendation) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    var creationDate: String
    var lastSeenTime: String
    var userRecommendedID: Int
    var isShown: Bool
    var userRecommended: User
}
