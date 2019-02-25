//
//  ConstantDefinitionTokenGenerator.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct ConstantDefinitionTokenGenerator: RegexTokenGenerator {
    
    var pattern: String {
        return "let\\b"
    }
    
    func token(from matched: String) throws -> Token? {
        return .constantDefinition
    }
    
}
