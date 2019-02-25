//
//  IdentifierTokenGenerator.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct IdentifierTokenGenerator: RegexTokenGenerator {
    
    var pattern: String {
        return "[a-zA-Z][a-zA-Z0-9]*\\b"
    }
    
    func token(from matched: String) throws -> Token? {
        return .identifier(matched)
    }
    
}
