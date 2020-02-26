//
//  Date+Extension.swift
//  PuzzleTrade
//
//  Created by Leandro Wauters on 2/22/20.
//  Copyright © 2020 Leandro Wauters. All rights reserved.
//

import Foundation

extension Date {
    static func getISOTimestamp() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        let timestamp = isoDateFormatter.string(from: Date())
        return timestamp
    }
}
