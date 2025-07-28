//
//  Question.swift
//  DevGuide
//
//  Created by Yurii Luka on 28.07.2025.
//

struct Question {
    let title: String
    let answer: [Answer]
    
//    static func getQuestions() -> [Question] {
//
//    }
}

struct Answer {
    let title: String
    let language: LanguageChosen
}

enum LanguageChosen: String {
    case cSharp = "C#"
    case python = "Python"
    case javaScript = "JavaScript"
    case swift = "Swift"
    
    var definition: String {
        switch self {
        case .cSharp:
            return "Вам подойдет С#"
        case .python:
            return "Вам подойдет Python"
        case .javaScript:
            return "Вам подойдет JavaScript"
        case .swift:
            return "Вам подойдет Swift"
        }
    }
}
