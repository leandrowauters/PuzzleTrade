//
//  Puzzle.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/4/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import Foundation

class Puzzle {
    
    var name: String
    var numberOfPieces: Int
    var brand: String
    var photo: String
    var postedBy: String
    var postedDate: String
    var reviewScore: Int?
    
    init(name: String, numberOfPieces: Int, brand: String, photo: String, postedBy: String, postedDate: String, reviewScore: Int) {
        self.name = name
        self.numberOfPieces = numberOfPieces
        self.brand = brand
        self.photo = photo
        self.postedBy = postedBy
        self.postedDate = postedDate
        self.reviewScore = reviewScore
    }
}
