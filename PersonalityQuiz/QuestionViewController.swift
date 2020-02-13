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
    var question: Question?
    
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
        endQuiz()
    }
    
    @IBAction func didTapSecondButton(_ sender: UIButton) {
        endQuiz()
    }
    
    @IBAction func didTapThirdButton(_ sender: UIButton) {
        endQuiz()
    }
    
    @IBAction func didTapFourthButton(_ sender: UIButton) {
        endQuiz()
    }
    
    
    // MARK: - outlets and actions from multiple choice
    
    @IBOutlet weak var firstLabelMultipleChoice: UILabel!
    
    @IBOutlet weak var secondLabelMultipleChoice: UILabel!
    
    @IBOutlet weak var thirdLabelMultipleChoice: UILabel!
    
    @IBOutlet weak var fourthLabelMultipleChoice: UILabel!
    
    @IBAction func firstSwitch(_ sender: UISwitch) {
    }
    
    
    @IBAction func secondSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func thirdSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func fourthSwitch(_ sender: UISwitch) {
    }
    
    
    func endQuiz() {
        performSegue(withIdentifier: ResultsViewController.endQuizSegueIdentifier, sender: nil)
    }
    
    
    // MARK: - view controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        question = state.nextQuestion()
        questionTitleLabel.text = question?.text
        quizProgressBar.progress = state.currentProgress
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == ResultsViewController.endQuizSegueIdentifier,
            let resultsViewController = segue.destination as? ResultsViewController else { return }
        
        resultsViewController.resultText = "You are a 🐱!"
        resultsViewController.resultComment = "You are loyal, friendly, energetic, a little bit lazy but you know how to take care of your friend. Woof!"
        
    }

}
