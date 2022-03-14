//
//  Card.swift
//  Flashzilla
//
//  Created by wizz on 3/6/22.
//

import Foundation

struct Card: Codable {
    
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Would plat the 13th Doctor in DOctor Who?", answer: "Jodie Whittaker")
}
