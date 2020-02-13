//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Adrian Tineo on 13.02.20.
//  Copyright © 2020 Adrian Tineo. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    var state = State()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "beginQuizSegue",
            let navigationController = segue.destination as? UINavigationController,
            let questionViewController = navigationController.children.first as? QuestionViewController else { return }
        
        questionViewController.state = state
    }

}

