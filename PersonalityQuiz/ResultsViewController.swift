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
    
    
    @IBAction func didTapDone(_ sender: UIBarButtonItem) {
        print("didTapDone")
    }
    
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var resultCommentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultTextLabel.text = resultText
        resultCommentLabel.text = resultComment
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
