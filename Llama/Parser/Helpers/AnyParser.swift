//
//  AnyParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {
    
    func any() -> AnyParser<Output> {
        return AnyParser(self)
    }
    
}

struct AnyParser<Output>: Parser {
    
    let _parse: ([Token]) throws -> ParserOutput<Output>
    
    init<P: Parser>(_ parser: P) where P.Output == Output {
        self._parse = parser.parse
    }
    
    func parse(tokens: [Token]) throws -> ParserOutput<Output> {
        return try _parse(tokens)
    }
}
