//
//  Value+FunctionCall+Argument+Parsable.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value.FunctionCall.Argument: Parsable {
    
    // ([Identifier]:)?[Value]
    static let parser: AnyParser<Value.FunctionCall.Argument> = {
        let label = IdentifierParser() && .colon
        let parser = label.? && Value.self
        return parser.map { Value.FunctionCall.Argument(label: $0, value: $1) }
    }()
    
}
