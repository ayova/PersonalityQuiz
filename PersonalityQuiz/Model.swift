//
//  Model.swift
//  PersonalityQuiz
//
//  Created by Adrian Tineo on 13.02.20.
//  Copyright © 2020 Adrian Tineo. All rights reserved.
//

import Foundation


struct Question {
    var text: String
    var type: ResponseType  // singleChoice, multipleChoice, rangeValue
    var possibleAnswers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType {
    case dog
    case cat
    case rabbit
    case turtle
    
    var definition: String {
        switch self {
        case .dog:
            return "You are loyal, friendly, energetic, a little bit lazy but you know how to take care of your friend. Woof!"
        case .cat:
            return "You are lazy, treacherous, affectionate and everybody loves you, purrrr!"
        case .rabbit:
            return "You are soft, cute, poopy-poo, vegan... what's up folks?!?!?"
        case .turtle:
            return "You are a great ninja warrior but running is not your thing. -----"
        }
    }
}
