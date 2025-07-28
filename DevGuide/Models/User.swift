//
//  User.swift
//  DevGuide
//
//  Created by Yurii Luka on 27.07.2025.
//

struct User {
    let login: String
    let password: String
    
    static func getUserData() -> User {
        User(login: "12", password: "12")
    }
}
