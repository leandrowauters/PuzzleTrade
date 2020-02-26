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
    
    init(dict: [String: Any]) {
        self.name = dict[PuzzleKeys.nameKey] as? String ?? ""
        self.numberOfPieces = dict[PuzzleKeys.numberOfPiecesKey] as? Int ?? 0
        self.brand = dict[PuzzleKeys.brandKey] as? String ?? ""
        self.photo = dict[PuzzleKeys.photoKey] as? String ?? ""
        self.postedBy = dict[PuzzleKeys.postedByKey] as? String ?? ""
        self.postedDate = dict[PuzzleKeys.postedDateKey] as? String ?? ""
        self.reviewScore = dict[PuzzleKeys.reviewScoreKey] as? Int ?? 0
    }
}
