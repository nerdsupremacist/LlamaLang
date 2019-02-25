//
//  PatternMatchingCaseParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension PatternMatching.Case: Parsable {
    
    // | [Match] -> [FunctionBody]
    static let parser: AnyParser<PatternMatching.Case> = {
        let parser = .case &&
            PatternMatching.Case.Match.self &&
            .arrow &&
            FunctionBody.self
        
        return parser.map { PatternMatching.Case(match: $0, body: $1) }
    }()
    
}
