//
//  Value+MembetCall+Selector+Parsable.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Value.MemberCall.Selector: Parsable {
    
    // [FunctionCall]|[Identifier]
    static let parser: AnyParser<Value.MemberCall.Selector> = Value.FunctionCall.parser.map { .method($0) } ||
        IdentifierParser().map { .property($0) }
    
}
