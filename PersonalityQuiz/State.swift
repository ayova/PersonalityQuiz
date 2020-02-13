//
//  State.swift
//  PersonalityQuiz
//
//  Created by Adrian Tineo on 13.02.20.
//  Copyright © 2020 Adrian Tineo. All rights reserved.
//

import Foundation


struct State {
    let questions: [Question]
    var currentQuestionIndex: Int
    
    mutating func nextQuestion() -> Question? {
        guard currentQuestionIndex < questions.count else { return nil}
        let question = questions[currentQuestionIndex]
        currentQuestionIndex += 1
        return question
    }
    
    var currentProgress: Float {
        guard questions.count > 0 else { return 0.0 }
        
        return Float(currentQuestionIndex)/Float(questions.count - 1)
    }
    
    var nextResponseType: ResponseType {
        return questions[currentQuestionIndex].type
    }
    
    init() {
        questions = [
            Question(text: "What is your favorite food?", type: .single, possibleAnswers: [
            Answer(text: "bones", type: .dog),
            Answer(text: "lettuce", type: .turtle),
            Answer(text: "fish", type: .cat),
            Answer(text: "carrot", type: .rabbit)
            ]),
            
        ]
        
        currentQuestionIndex = 0
    }
}


