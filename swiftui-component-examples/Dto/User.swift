//
//  User.swift
//  swiftui-component-examples
//
//  Created by Andreas on 27.02.2023.
//

import Foundation

struct User: Equatable, Identifiable {
    
    internal init() {
        self.id = 1
        self.name = "name"
        self.sex = "sex"
        self.birthdate = ""
        self.isBanned = true
        self.isPush = false
        self.isGeo = false
        self.lastGeoID = 1
        self.canChangeBirthdate = true
        self.canChangeSex = true
        self.lastVisit = ""
        self.cityId = 1
        self.avatarId = 1
        self.isVerify = true
        self.media = []
        self.isProfileCompleted = true
        self.avatar = Media()
        self.updateBirthdate = .init()
    }
    
    
    let id: Int
    var name: String 
    var sex: String
    var birthdate: String
    var isBanned: Bool
    var isPush: Bool
    var isGeo: Bool
    var lastGeoID: Int
    var canChangeBirthdate: Bool
    var canChangeSex: Bool
    var lastVisit: String
    var cityId: Int
    var avatarId: Int
    var isVerify: Bool
    var media: [Media]
    var isProfileCompleted: Bool
    var avatar: Media? = nil
    
    // raw
    var updateBirthdate: Date
    
}
