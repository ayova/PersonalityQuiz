//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Adrian Tineo on 13.02.20.
//  Copyright © 2020 Adrian Tineo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var state: State!
    var question: Question!
    
    // MARK: - common outlets
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var quizProgressBar: UIProgressView!
    
    
    @IBOutlet weak var multipleChoiceStackView: UIStackView!
    @IBOutlet weak var singleChoiceStackView: UIStackView!
    
    // MARK: - outlets and actions for single choice
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    @IBAction func didTapFirstButton(_ sender: UIButton) {
        guard let question = question else { return }
        state.add(answers: [question.possibleAnswers[0]])
        nextQuestion()
    }
    
    @IBAction func didTapSecondButton(_ sender: UIButton) {
        guard let question = question else { return }
        state.add(answers: [question.possibleAnswers[1]])
        nextQuestion()
    }
    
    @IBAction func didTapThirdButton(_ sender: UIButton) {
        guard let question = question else { return }
        state.add(answers: [question.possibleAnswers[2]])
        nextQuestion()
    }
    
    @IBAction func didTapFourthButton(_ sender: UIButton) {
        guard let question = question else { return }
        state.add(answers: [question.possibleAnswers[3]])
        nextQuestion()
    }
    
    // MARK: - outlets and actions from multiple choice
    @IBOutlet weak var firstLabelMultipleChoice: UILabel!
    @IBOutlet weak var secondLabelMultipleChoice: UILabel!
    @IBOutlet weak var thirdLabelMultipleChoice: UILabel!
    @IBOutlet weak var fourthLabelMultipleChoice: UILabel!
    
    @IBOutlet weak var firstSwitch: UISwitch!
    @IBOutlet weak var secondSwitch: UISwitch!
    @IBOutlet weak var thirdSwitch: UISwitch!
    @IBOutlet weak var fourthSwitch: UISwitch!
    
    @IBAction func submitMultipleChoiceAnswerButton(_ sender: Any) {
    }
        
    @IBAction func didTapSubmitAnswerButton(_ sender: UIButton) {
        var chosenAnswers: [Answer] = []
        if firstSwitch.isOn {
            chosenAnswers.append(question.possibleAnswers[0])
        }
        if secondSwitch.isOn {
            chosenAnswers.append(question.possibleAnswers[1])
        }
        if thirdSwitch.isOn {
            chosenAnswers.append(question.possibleAnswers[2])
        }
        if fourthSwitch.isOn {
            chosenAnswers.append(question.possibleAnswers[3])
        }
        
        state.add(answers: chosenAnswers)
        
        nextQuestion()
    }
    
    func nextQuestion() {
        endQuiz()
    }
    
    func endQuiz() {
        
        print("Chosen answers: \(state.chosenAnswers)")
        
        performSegue(withIdentifier: ResultsViewController.endQuizSegueIdentifier, sender: nil)
    }
    
    
    // MARK: - view controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        question = state.nextQuestion()
        
        questionTitleLabel.text = question.text
        quizProgressBar.progress = state.currentProgress
        
        switch question.type {
        case .single:
            multipleChoiceStackView.isHidden = true
        case .multiple:
            singleChoiceStackView.isHidden = true
        case .ranged:
            singleChoiceStackView.isHidden = true
            multipleChoiceStackView.isHidden = true
        }
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == ResultsViewController.endQuizSegueIdentifier,
            let resultsViewController = segue.destination as? ResultsViewController else { return }
        
        resultsViewController.resultText = "You are a 🐱!"
        resultsViewController.resultComment = "You are loyal, friendly, energetic, a little bit lazy but you know how to take care of your friend. Woof!"
    }

}
