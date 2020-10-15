//
//  TypeRacerController.swift
//  TypeRacer
//
//  Created by Jason Koceja on 10/14/20.
//

import Foundation

enum TypeRacerStatus {
    case typo
    case noErrors
    case complete
}

class TypeRacerController {
    
    static func createTypeRacer(paragraph: String = Paragraphs.textPrompts.randomElement() ?? "", timeCompleted: TimeInterval? = nil, wpm: Int? = nil) -> TypeRacer {
        return TypeRacer(paragraph: paragraph, timeCompleted: timeCompleted, wpm: wpm)
    }
    
    static func completeTypeRacer(typeRacer: TypeRacer, timeCompleted: TimeInterval) {
        typeRacer.timeCompleted = timeCompleted
        
        let words = typeRacer.paragraph.components(separatedBy: " ")
        let wpm = words.count / (Int(timeCompleted) / 60)
        
        typeRacer.wpm = wpm
    }
    
    static func checkText(text: String, typeRacer: TypeRacer) -> TypeRacerStatus {
        let paragraph = typeRacer.paragraph
        
        if paragraph == text {
            return .complete
        } else if paragraph.contains(text) {
            return .noErrors
        } else {
            return .typo
        }
    }
    
}
