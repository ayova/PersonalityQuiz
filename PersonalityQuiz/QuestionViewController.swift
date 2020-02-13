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
    
    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var quizProgressBar: UIProgressView!
    
    
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
    
    
    func endQuiz() {
        performSegue(withIdentifier: ResultsViewController.endQuizSegueIdentifier, sender: nil)
    }
    
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
