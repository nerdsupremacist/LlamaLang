//
//  MethodCallParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value.MemberCall.Selector: Parsable {
    
    static let parser: AnyParser<Value.MemberCall.Selector> = Value.FunctionCall.parser.map { .method($0) } ||
        IdentifierParser().map { .property($0) }
    
}

extension Value.MemberCall: Parsable {
    
    static let parser: AnyParser<Value.MemberCall> = {
        let call = .dot && Value.MemberCall.Selector.self
        let parser = Value.methodCallMemberParser && call+
        return parser.map { Value.MemberCall(value: $0, members: $1) }
    }()
    
}
