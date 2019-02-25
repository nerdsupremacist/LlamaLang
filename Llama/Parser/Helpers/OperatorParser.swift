//
//  OperatorParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct ExpectedOperator: Error {
    let received: Token
}

struct OperatorParser: SingleTokenParser {
    typealias Output = String
    
    func parse(token: Token) throws -> String {
        switch token {
        case .operator(let `operator`):
            return `operator`
        case .openGeneric:
            return "<"
        case .closeGeneric:
            return ">"
        default:
            throw ExpectedOperator(received: token)
        }
    }
}
