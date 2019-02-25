//
//  MethodCallParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value.MemberCall: Parsable {
    
    // [Value](.[Selector])+
    static let parser: AnyParser<Value.MemberCall> = {
        let call = .dot && Value.MemberCall.Selector.self
        let parser = Value.methodCallMemberParser && call+
        return parser.map { Value.MemberCall(value: $0, members: $1) }
    }()
    
}
