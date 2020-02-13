//
//  State.swift
//  PersonalityQuiz
//
//  Created by Adrian Tineo on 13.02.20.
//  Copyright © 2020 Adrian Tineo. All rights reserved.
//

import Foundation


struct State {
    private let questions: [Question]
    private var currentQuestionIndex: Int
    var chosenAnswers: [Answer]
    
    init() {
        questions = [
            Question(text: "What is your favorite food?", type: .single, possibleAnswers: [
                Answer(text: "bones", type: .dog),
                Answer(text: "lettuce", type: .turtle),
                Answer(text: "fish", type: .cat),
                Answer(text: "carrot", type: .rabbit)
            ]),
            Question(text: "Which activities do you enjoy?", type: .multiple, possibleAnswers: [
                Answer(text: "swimming", type: .turtle),
                Answer(text: "eating", type: .dog),
                Answer(text: "sleeping", type: .cat),
                Answer(text: "cuddling", type: .rabbit)
            ])
            
        ]
        
        currentQuestionIndex = 0
        chosenAnswers = []
    }
    
    mutating func nextQuestion() -> Question? {
        guard currentQuestionIndex < questions.count else { return nil}
        let question = questions[currentQuestionIndex]
        currentQuestionIndex += 1
        return question
    }
    
    mutating func add(answers: [Answer]) {
        chosenAnswers += answers
    }
    
    var currentProgress: Float {
        guard questions.count > 0 else { return 0.0 }
        
        return Float(currentQuestionIndex+1)/Float(questions.count)
    }
    
    var nextResponseType: ResponseType {
        return questions[currentQuestionIndex].type
    }
    
    var hasNextQuestion: Bool {
        return currentQuestionIndex < questions.count
    }
    
    var currentQuestionNumber: Int {
        return currentQuestionIndex + 1
    }
    
    var totalNumberOfQuestions: Int {
        return questions.count
    }
}


