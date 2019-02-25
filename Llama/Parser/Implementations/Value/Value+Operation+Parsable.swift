//
//  OperationParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value.Operation: Parsable {
    
    // [Value][Operator][Value]
    static let parser: AnyParser<Value.Operation> = {
        let parser = Value.firstMemberOfOperatioParser && OperatorParser() && Value.self
        return parser.map { Value.Operation(operator: $0.1, lhs: $0.0, rhs: $1) }
    }()
    
}
