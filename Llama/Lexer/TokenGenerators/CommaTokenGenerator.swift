//
//  CommeTokenGenerator.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct CommaTokenGenerator: RegexTokenGenerator {
    
    var pattern: String {
        return ","
    }
    
    func token(from matched: String) throws -> Token? {
        return .comma
    }
    
}
