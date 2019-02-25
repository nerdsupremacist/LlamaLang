//
//  IfElseBodyParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension FunctionBody.IfElse: Parsable {
    
    // [Value] if [Value] else [Value]
    static let parser: AnyParser<FunctionBody.IfElse> = {
        let parser = Value.self && .if && Value.self && .else && Value.self
        return parser.map { FunctionBody.IfElse(condition: $0.1, trueBranch: $0.0, falseBranch: $1) }
    }()
    
}
