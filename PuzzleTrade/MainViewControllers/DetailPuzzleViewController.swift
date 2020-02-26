//
//  DetailPuzzleViewController.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/4/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import UIKit
import Kingfisher
class DetailPuzzleViewController: UIViewController {

    var puzzle: Puzzle!
    
    @IBOutlet weak var brandPiecesLabel: UILabel!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var postedDateLabel: UILabel!
    @IBOutlet weak var PuzzleUserReview: UILabel!
    @IBOutlet weak var tradeView: UIView!
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var puzzleImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = puzzle.name
        print(puzzle.name)
        setupUI()
    }
    
    func setupUI() {
        brandPiecesLabel.text = "\(puzzle.brand) / \(puzzle.numberOfPieces)"
        postedByLabel.text = puzzle.postedBy
        postedDateLabel.text = puzzle.postedDate
        PuzzleUserReview.text = "Puzzle Review: \(puzzle.reviewScore!)%    User Review: 100%"
        guard let url = URL(string: puzzle.photo) else {return}
        puzzleImage.kf.setImage(with: url)
    }


}
