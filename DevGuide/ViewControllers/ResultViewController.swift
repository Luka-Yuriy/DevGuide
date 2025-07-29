//
//  ResultViewController.swift
//  DevGuide
//
//  Created by Yurii Luka on 29.07.2025.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var languageLable: UILabel!
    @IBOutlet var languageDescriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
}

extension ResultViewController {
    private func updateResult() {
        var frequencyOfLanguages: [ProgrammingLanguage: Int] = [:]
        let languages = answers.map { $0.language }
        
        for language in languages {
            frequencyOfLanguages[language, default: 0] += 1
        }
        
        let sortedFrequencyOfLanguages = frequencyOfLanguages.sorted { $0.value > $1.value }
        guard let mostFrequentLanguage = sortedFrequencyOfLanguages.first?.key else { return }
        
        undateUI(with: mostFrequentLanguage)
    }
    
    private func undateUI(with language: ProgrammingLanguage) {
        languageLable.text = language.rawValue
        languageDescriptionLabel.text = language.definition
    }
}
