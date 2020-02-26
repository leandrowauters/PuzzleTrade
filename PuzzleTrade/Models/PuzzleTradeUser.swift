//
//  PuzzleTradeUser.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/22/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import Foundation

class PuzzleTradeUser: Codable {
    var username: String
    var email: String
    var joinedDate: String
    var userId: String
    
    init(username: String, email: String, joinedDate: String, userId: String) {
        self.username = username
        self.email = email
        self.joinedDate = joinedDate
        self.userId = userId
    }
    
    init(dict: [String: Any]) {
        self.email = dict[PuzzleTradeUserKeys.emailKey] as? String ?? ""
        self.username = dict[PuzzleTradeUserKeys.usernameKey] as? String ?? ""
        self.joinedDate = dict[PuzzleTradeUserKeys.joinedDateKey] as? String ?? ""
        self.userId = dict[PuzzleTradeUserKeys.userIdKey] as? String ?? ""
    }
}
