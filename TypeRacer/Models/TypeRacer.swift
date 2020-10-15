//
//  TypeRacer.swift
//  TypeRacer
//
//  Created by Jason Koceja on 10/14/20.
//

import Foundation

class TypeRacer {
    
    var paragraph: String
    var timeCompleted: TimeInterval?
    var wpm: Int?
    
    init(paragraph: String, timeCompleted: TimeInterval?, wpm: Int?) {
        self.paragraph = paragraph
        self.timeCompleted = timeCompleted
        self.wpm = wpm
    }
    
}
