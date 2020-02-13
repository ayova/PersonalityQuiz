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
    
    @IBOutlet weak var submitMultipleAnswerButton: UIButton!
    
    @IBAction func didTapFirstSwitch(_ sender: UISwitch) {
        updateSubmitButton()
    }
    
    @IBAction func didTapSecondSwitch(_ sender: UISwitch) {
        updateSubmitButton()
    }
    
    @IBAction func didTapThirdSwitch(_ sender: UISwitch) {
        updateSubmitButton()
    }
    
    @IBAction func didTapFourthSwitch(_ sender: UISwitch) {
        updateSubmitButton()
    }
    
    func updateSubmitButton() {
        if firstSwitch.isOn || secondSwitch.isOn || thirdSwitch.isOn || fourthSwitch.isOn {
            submitMultipleAnswerButton.isEnabled = true
        } else {
            submitMultipleAnswerButton.isEnabled = false
        }
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
    
    // MARK: - view controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Question \(state.currentQuestionNumber) / \(state.totalNumberOfQuestions)"
        quizProgressBar.progress = state.currentProgress
        
        question = state.nextQuestion()
        
        questionTitleLabel.text = question.text

        
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
    func nextQuestion() {
        if state.hasNextQuestion {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let questionViewController = storyboard.instantiateViewController(withIdentifier: "Question") as! QuestionViewController
            questionViewController.state = state
            navigationController?.show(questionViewController, sender: nil)
            
        } else {
            print("Chosen answers: \(state.chosenAnswers)")
            
            performSegue(withIdentifier: ResultsViewController.endQuizSegueIdentifier, sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == ResultsViewController.endQuizSegueIdentifier,
            let resultsViewController = segue.destination as? ResultsViewController else { return }
        
        
        
        let winningAnimal = state.winningAnimal
        resultsViewController.resultText = winningAnimal.message
        resultsViewController.resultComment = winningAnimal.comment
    }
    
}
