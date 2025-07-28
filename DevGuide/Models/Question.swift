//
//  Question.swift
//  DevGuide
//
//  Created by Yurii Luka on 28.07.2025.
//

struct Question {
    let title: String
    let answer: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "What type of projects are you most interested in?",
                answer: [
                    Answer(title: "Developing games", language: .cSharp),
                    Answer(title: "Scientific computing and analytics", language: .python),
                    Answer(title: "Web development", language: .javaScript),
                    Answer(title: "Creating mobile applications", language: .swift)
                ]
            ),
            Question(
                title: "How important is cross-platform compatibility to you?",
                answer: [
                    Answer(title: "Very important, I want to write once and run on all devices", language: .cSharp),
                    Answer(title: "Not very important, I can write separately for each platform", language: .javaScript)
                ]
            ),
            Question(
                title: "How much complexity are you willing to handle?",
                answer: [
                    Answer(title: " Prefer simple and understandable languages", language: .swift),
                    Answer(title: "Ready to learn complex concepts and languages with rich functionality", language: .cSharp)
                ]
            ),
            Question(
                title: "What tools or development environments do you prefer?",
                answer: [
                    Answer(title: "Visual Studio, Visual Studio Code", language: .python),
                    Answer(title: "Unity", language: .cSharp),
                    Answer(title: "Web browsers and server platforms", language: .javaScript),
                    Answer(title: "Specialized IDEs for mobile development", language: .swift)
                ])
        ]
    }
}

struct Answer {
    let title: String
    let language: ProgrammingLanguage
}

enum ProgrammingLanguage: String {
    case cSharp = "C#"
    case python = "Python"
    case javaScript = "JavaScript"
    case swift = "Swift"
    
    var definition: String {
        switch self {
        case .cSharp:
            return "The most suitable С#"
        case .python:
            return "The most suitable Python"
        case .javaScript:
            return "The most suitable JavaScript"
        case .swift:
            return "The most suitable Swift"
        }
    }
}
