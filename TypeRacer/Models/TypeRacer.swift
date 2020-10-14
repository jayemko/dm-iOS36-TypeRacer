//
//  TypeRacer.swift
//  TypeRacer
//
//  Created by Jason Koceja on 10/14/20.
//

import Foundation

class TypeRacer {
    
    var paragraph: String
    var username: String
    var timeCompleted: TimeInterval?
    var wpm: Int?
    
    init(paragraph: String, username: String, timeCompleted: TimeInterval?, wpm: Int?) {
        self.paragraph = paragraph
        self.username = username
        self.timeCompleted = timeCompleted
        self.wpm = wpm
    }
    
}
