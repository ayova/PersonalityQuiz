//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Adrian Tineo on 13.02.20.
//  Copyright © 2020 Adrian Tineo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    static let endQuizSegueIdentifier = "endQuizSegue"
    
    var resultText: String?
    var resultComment: String?
    
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var resultCommentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultTextLabel.text = resultText
        resultCommentLabel.text = resultComment
        
        navigationItem.hidesBackButton = true
    }

}
