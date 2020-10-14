//
//  TypeRacerController.swift
//  TypeRacer
//
//  Created by Jason Koceja on 10/14/20.
//

import Foundation

class TypeRacerController {
    
    static func createTypeRacer(paragraph: String, username: String, timeCompleted: TimeInterval? = nil, wpm: Int? = nil) -> TypeRacer {
        return TypeRacer(paragraph: paragraph, username: username, timeCompleted: timeCompleted, wpm: wpm)
    }
    
    static func completeTypeRacer(typeRacer: TypeRacer, timeCompleted: TimeInterval) {
        typeRacer.timeCompleted = timeCompleted
        
        let words = typeRacer.paragraph.components(separatedBy: " ")
        let wpm = words.count / (Int(timeCompleted) / 60)
        
        typeRacer.wpm = wpm
    }
    
}
