//
//  PuzzlesViewController.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/4/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import UIKit
import Kingfisher
class PuzzlesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    var puzzles = [Puzzle]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let puzzle = Puzzle(name: "House", numberOfPieces: 1000, brand: "Educa", photo: "https://firebasestorage.googleapis.com/v0/b/eliteapp-cb035.appspot.com/o/images%2FBOIkUdVEGlghNHFq7JQpxBs7mG72?alt=media&token=13953e98-a944-4162-bb7f-9c99521a4a1f", postedBy: "NA", postedDate: "NA", reviewScore: 98)
        let puzzle2 = Puzzle(name: "House", numberOfPieces: 1000, brand: "Educa", photo: "https://firebasestorage.googleapis.com/v0/b/eliteapp-cb035.appspot.com/o/images%2FBOIkUdVEGlghNHFq7JQpxBs7mG72?alt=media&token=13953e98-a944-4162-bb7f-9c99521a4a1f", postedBy: "N/A", postedDate: "N/A", reviewScore: 98)
        puzzles.append(puzzle)
        puzzles.append(puzzle2)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        if let target = segue.destination as? DetailPuzzleViewController {
            target.puzzle = puzzles[selectedPath.row]
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return puzzles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let puzzle = puzzles[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {fatalError()}
        cell.textLabel!.text = puzzle.name
        cell.detailTextLabel!.text = "\(puzzle.brand) / \(puzzle.numberOfPieces) PCs"
        guard let url = URL(string: puzzle.photo) else {return UITableViewCell()}
        cell.imageView?.kf.setImage(with: url)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .secondarySystemBackground
        } else {
            cell.backgroundColor = .tertiarySystemBackground
        }
        
        return cell
    }


}
