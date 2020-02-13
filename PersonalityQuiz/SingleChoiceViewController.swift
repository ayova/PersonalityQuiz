//
//  SingleChoiceViewController.swift
//  PersonalityQuiz
//
//  Created by Adrian Tineo on 13.02.20.
//  Copyright © 2020 Adrian Tineo. All rights reserved.
//

import UIKit

class SingleChoiceViewController: QuestionViewController {

    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
    
    @IBAction func didTapFirstButton(_ sender: UIButton) {
    }
    
    
    @IBAction func didTapSecondButton(_ sender: UIButton) {
    }
    
    
    @IBAction func didTapThirdButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapFourthButton(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
