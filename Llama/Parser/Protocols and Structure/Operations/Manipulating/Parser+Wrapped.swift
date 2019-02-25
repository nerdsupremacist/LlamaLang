//
//  WrappedParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

enum Wrapper {
    case parenthesis
    case brackets
    case generics
}

extension Wrapper {
    
    fileprivate var start: Token {
        switch self {
        case .parenthesis:
            return .openParenthesis
        case .brackets:
            return .openBrackets
        case .generics:
            return .openGeneric
        }
    }
    
    fileprivate var end: Token {
        switch self {
        case .parenthesis:
            return .closeParenthesis
        case .brackets:
            return .closeBrackets
        case .generics:
            return .closeGeneric
        }
    }
    
}

extension Parser {
    
    private func wrapped(by start: Token, and end: Token) -> AnyParser<Output> {
        return start && self && end
    }
    
    func wrapped(by wrapper: Wrapper) -> AnyParser<Output> {
        return wrapped(by: wrapper.start, and: wrapper.end)
    }
    
}
