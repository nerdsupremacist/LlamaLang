//
//  FunctionCallParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value.FunctionCall.Argument: Parsable {
    
    static let parser: AnyParser<Value.FunctionCall.Argument> = {
        let label = IdentifierParser() && .colon
        let parser = label.? && Value.self
        return parser.map { Value.FunctionCall.Argument(label: $0, value: $1) }
    }()
    
}

extension Value.FunctionCall.Arguments: Parsable {
    
    static let parser: AnyParser<Value.FunctionCall.Arguments> = {
        let parser = .openParenthesis && Value.FunctionCall.Argument.parser.recursvie(with: .comma).? && .closeParenthesis
        return parser.map { Value.FunctionCall.Arguments(arguments: $0 ?? []) }
    }()
    
}

extension Value.FunctionCall: Parsable {
    
    static let parser: AnyParser<Value.FunctionCall> = {
        let parser = IdentifierParser() && Value.FunctionCall.Arguments.self
        return parser.map { Value.FunctionCall(name: $0, arguments: $1) }
    }()
    
}
