//
//  Value+FunctionCall+Arguments+Parsable.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value.FunctionCall.Arguments: Parsable {
    
    // (([Argument](,[Argument])*)?)
    static let parser: AnyParser<Value.FunctionCall.Arguments> = {
        return Value.FunctionCall.Argument.parser
            .recursive(with: .comma)
            .optional()
            .wrapped(by: .parenthesis)
            .map { Value.FunctionCall.Arguments(arguments: $0 ?? []) }
    }()
    
}
