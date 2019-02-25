//
//  ValueParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value: Parsable {
    
    static let wrappedParser: AnyParser<Value> = Value
        .indirect
        .wrapped(by: .openParenthesis, and: .closeParenthesis)
        .map { .wrapped($0) }
    
    static let noRecursionStartingWithValue: AnyParser<Value> = Value.Function.parser.map { .function($0) } ||
        methodCallMemberParser
    
    static let methodCallParser: AnyParser<Value> = MemberCall.parser.map { .methodCall($0) }
    
    static let tupleParser: AnyParser<Value> = Tuple.parser.map { .tuple($0) }
    
    static let firstMemberOfOperatioParser: AnyParser<Value> = methodCallParser ||
        tupleParser ||
        noRecursionStartingWithValue
    
    static let memberOfTupleParser: AnyParser<Value> = methodCallParser ||
        noRecursionStartingWithValue
    
    static let methodCallMemberParser: AnyParser<Value> = Value.FunctionCall.parser.map { .functionCall($0) } ||
        [String : Value].parser.map { .object($0) } ||
        NumberParser().map { .number($0) } ||
        StringParser().map { .string($0) } ||
        IdentifierParser().map { .variable($0) } ||
        wrappedParser ||
        voidParser.map { .void }
    
    static let parser: AnyParser<Value> = Operation.parser.map { .operation($0) } ||
        tupleParser ||
        methodCallParser ||
        noRecursionStartingWithValue
}
