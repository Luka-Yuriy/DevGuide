//
//  Mentor.swift
//  DevGuide
//
//  Created by Yurii Luka on 28.07.2025.
//

struct Mentor {
    let name: String
    let surname: String
    let photo: String
    
    static func getMentorIngo() -> [Mentor] {
        [
        Mentor(name: "Bill", surname: "Black", photo: "Bill"),
        Mentor(name: "Tim", surname: "Frider", photo: "Tim"),
        Mentor(name: "Bob", surname: "Phileps", photo: "Bob"),
        Mentor(name: "Freddie", surname: "Plate", photo: "Freddie"),
        Mentor(name: "Julia", surname: "Smith", photo: "Julia")
        ]
    }
}
