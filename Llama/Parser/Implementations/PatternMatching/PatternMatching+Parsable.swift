//
//  PatternMatchingParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension PatternMatching: Parsable {
    
    // match [Identifier] with [Case]+
    static let parser: AnyParser<PatternMatching> = {
        let parser = .match &&
            IdentifierParser() &&
            .with &&
            PatternMatching.Case.parser+
        
        return parser.map { PatternMatching(identifier: $0, cases: $1) }
    }()
    
}
