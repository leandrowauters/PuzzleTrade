//
//  PuzzlesViewController.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/4/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase
class PuzzlesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var listener: ListenerRegistration!
    
    var puzzles = [Puzzle]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    

    var userId: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        userId = AuthService.userId
        fetchUserPuzzles()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        listener.remove()
    }
    
    private func fetchUserPuzzles() {
        listener = DBService.fetchUserPuzzles(userId: AuthService.userId, completion: { (error, puzzles) in
            if let error = error {
                self.showAlert(title: "Error fetching puzzles", message: error.localizedDescription)
                self.activityIndicator.stopAnimating()
            }
            if let puzzles = puzzles {
                self.puzzles = puzzles
                self.activityIndicator.stopAnimating()
            }
        })
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
