//
//  NumberTokenGenerator.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct InvalidNumberLiteralError: Error {
    let text: String
}

struct NumberTokenGenerator: RegexTokenGenerator {
    
    var pattern: String {
        return "[0-9\\.]+\\b"
    }
    
    func token(from matched: String) throws -> Token? {
        guard let value = Double(matched) else { throw InvalidNumberLiteralError(text: matched) }
        return .number(value)
    }
    
}
