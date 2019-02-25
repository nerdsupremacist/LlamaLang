//
//  ExpressionParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Expression: Parsable {
    
    static let parser: AnyParser<Expression> = {
        return TypeDefinition.parser.map { .type($0) } ||
            MethodDefinition.parser.map { .method($0) } ||
            ConstantDefinition.parser.map { .constant($0) } ||
            Value.parser.map { .value($0) }
    }()
    
}
