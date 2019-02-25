//
//  InlineFunctionParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value.Function: Parsable {
    
    // [Arguments] -> [FunctionBody]
    static let parser: AnyParser<Value.Function> = {
        let parser = FunctionSignature.Arguments.self && .arrow && FunctionBody.self
        return parser.map { Value.Function(arguments: $0, body: $1) }
    }()
    
}
