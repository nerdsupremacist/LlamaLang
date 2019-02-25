//
//  FunctionCallParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value.FunctionCall: Parsable {
    
    // [Identifier][Arguments]
    static let parser: AnyParser<Value.FunctionCall> = {
        let parser = IdentifierParser() && Value.FunctionCall.Arguments.self
        return parser.map { Value.FunctionCall(name: $0, arguments: $1) }
    }()
    
}
