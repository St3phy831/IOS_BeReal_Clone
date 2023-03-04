//
//  DateFormatter.swift
//  BeReal_Clone
//
//  Created by Stephanie Hernandez on 3/4/23.
//

import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
