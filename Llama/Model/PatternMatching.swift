//
//  PatternMatching.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct PatternMatching {
    
    struct Case {
        
        enum Match {
            // TODO: Match underscores inside of tuples
            // TODO: Match concrete values in tuples too
            // TODO: Match objects too
            case tuple([String])
            case void
            case `default`
        }
        
        let match: Match
        let body: FunctionBody
    }
    
    let identifier: String
    let cases: [Case]
}
