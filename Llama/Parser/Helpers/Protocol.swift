//
//  Protocol.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct ParsableValueDidNotUseAllTokens<Value: Parsable>: Error {
    let value: Value
    let tokens: [Token]
}

protocol Parsable {
    static var parser: AnyParser<Self> { get }
}

extension Optional: Parsable where Wrapped: Parsable {
    
    static var parser: AnyParser<Wrapped?> {
        return Wrapped.parser.?
    }
    
}

extension Array: Parsable where Element: Parsable {
    
    static var parser: AnyParser<Array<Element>> {
        return Element.parser*
    }
    
}

extension Parsable {
    
    init(tokens: [Token]) throws {
        let output = try Self.parser.parse(tokens: tokens)
        guard output.remaining.isEmpty else {
            throw ParsableValueDidNotUseAllTokens(value: output.output,
                                                  tokens: output.remaining)
        }
        self = output.output
    }
    
    init(input: String) throws {
        let tokens = try Lexer.tokenize(input: input)
        try self.init(tokens: tokens)
    }
    
}

extension Parsable {
    
    static var indirect: AnyParser<Self> {
        return IndirectParsable<Self>().any()
    }
    
}

private struct IndirectParsable<P: Parsable>: DelegatedParser {
    typealias Output = P
    
    var parser: AnyParser<P> {
        return P.parser
    }
}
