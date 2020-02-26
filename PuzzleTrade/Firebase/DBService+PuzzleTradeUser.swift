//
//  DBService+PuzzleTradeUser.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/22/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import Foundation
import Firebase
extension DBService {
    
    static public var currentPuzzleTradeUser: PuzzleTradeUser!
    
    static public func createUser(puzzleTradeUser: PuzzleTradeUser, completion: @escaping (Error?) -> Void) {
        DBService.firestoreDB.collection(PuzzleTradeUserKeys.collectionKey).document(puzzleTradeUser.userId).setData(
        [PuzzleTradeUserKeys.emailKey : puzzleTradeUser.email,
         PuzzleTradeUserKeys.usernameKey : puzzleTradeUser.username,
         PuzzleTradeUserKeys.joinedDateKey : puzzleTradeUser.joinedDate,
         PuzzleTradeUserKeys.userIdKey : puzzleTradeUser.userId]) { (error) in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    
    static public func deleteAccount(userId: String, completion: @escaping (Error?) -> Void) {
        DBService.firestoreDB
            .collection(PuzzleTradeUserKeys.collectionKey)
            .document(userId)
            .delete { (error) in
                if let error = error {
                    completion(error)
                } else {
                    completion(nil)
                }
        }
    }
    
    static public func fetchUser(userId: String, completion: @escaping (Error?, PuzzleTradeUser?) -> Void) {
        DBService.firestoreDB
            .collection(PuzzleTradeUserKeys.collectionKey)
            .whereField(PuzzleTradeUserKeys.userIdKey, isEqualTo: userId)
            .getDocuments { (snapshot, error) in
                if let error = error {
                    completion(error, nil)
                } else if let snapshot = snapshot?.documents.first {
                    let user = PuzzleTradeUser(dict: snapshot.data())
                    completion(nil, user)
                } else {
                    completion(nil, nil)
                }
        }
    }
    
    static public func fetchUserPuzzles(userId: String, completion: @escaping(Error?, [Puzzle]?) -> Void) -> ListenerRegistration {
        return firestoreDB.collection(PuzzleKeys.collectionKey).whereField(PuzzleKeys.postedByKey, isEqualTo: userId).addSnapshotListener { (snapshot, error) in
            if let error = error {
                completion(error, nil)
            }
            if let snapshot = snapshot {
                let puzzles = snapshot.documents.map({Puzzle.init(dict: $0.data())})
                completion(nil, puzzles)
            }
        }
    }
}
