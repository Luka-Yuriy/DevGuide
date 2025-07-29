//
//  TestViewController.swift
//  DevGuide
//
//  Created by Yurii Luka on 29.07.2025.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var firstQuestionStackView: UIStackView!
    @IBOutlet var firstQuestionButtons: [UIButton]!
    
    @IBOutlet var secondQuestionStackView: UIStackView!
    @IBOutlet var secondQuestionButtons: [UIButton]!
    
    @IBOutlet var thirdQuestionStackView: UIStackView!
    @IBOutlet var thirdQuestionButtons: [UIButton]!
    
    @IBOutlet var fourthQuestionStackView: UIStackView!
    @IBOutlet var fourthQuestionButtons: [UIButton]!
    
    private let questions = Question.getQuestions()
    private var answerChosen: [Answer] = []
    private var questionIndex = 0
    private var currentAnswer: [Answer] {
        questions[questionIndex].answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.answers = answerChosen
    }
    
    @IBAction func firstAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = firstQuestionButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswer[buttonIndex]
        answerChosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func secondAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = secondQuestionButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswer[buttonIndex]
        answerChosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func trirdAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = thirdQuestionButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswer[buttonIndex]
        answerChosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func fourthAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = fourthQuestionButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswer[buttonIndex]
        answerChosen.append(currentAnswer)
        nextQuestion()
    }
}

extension TestViewController {
    private func updateUI() {
        for stackView in [firstQuestionStackView, secondQuestionStackView, thirdQuestionStackView, fourthQuestionStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Question № \(questionIndex + 1) out of \(questions.count)"
        
        setCurrentAnswers(for: currentQuestion.responseNumber)
    }
    
    private func setCurrentAnswers(for type: ResponseNumber) {
        switch type {
            case .first:
            setFirstQuestionAnswers(with: currentAnswer)
        case .second:
            setSecondQuestionAnswers(with: currentAnswer)
        case .third:
            setThirdQuestionAnswers(with: currentAnswer)
        case .fourth:
            setFourthQuestionAnswers(with: currentAnswer)
        }
    }
    
    private func setFirstQuestionAnswers(with answers: [Answer]) {
        firstQuestionStackView.isHidden.toggle()
        
        for (button, answers) in zip(firstQuestionButtons, answers) {
            button.setTitle(answers.title, for: .normal)
        }
    }
    
    private func setSecondQuestionAnswers(with answers: [Answer]) {
        secondQuestionStackView.isHidden.toggle()
        
        for (button, answers) in zip(secondQuestionButtons, answers) {
            button.setTitle(answers.title, for: .normal)
        }
    }
    
    private func setThirdQuestionAnswers(with answers: [Answer]) {
        thirdQuestionStackView.isHidden.toggle()
        
        for (button, answers) in zip(thirdQuestionButtons, answers) {
            button.setTitle(answers.title, for: .normal)
        }
    }
    
    private func setFourthQuestionAnswers(with answers: [Answer]) {
        fourthQuestionStackView.isHidden.toggle()
        
        for (button, answers) in zip(fourthQuestionButtons, answers) {
            button.setTitle(answers.title, for: .normal)
        }
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "ResultVC", sender: nil)
    }
}
