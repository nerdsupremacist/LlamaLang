//
//  Parser+Map.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {
    
    func map<T>(_ transform: @escaping (Output) throws -> T) -> AnyParser<T> {
        return MappedParser(source: self, transform: transform).any()
    }
    
}

private struct MappedParser<Source: Parser, Output>: Parser {
    let source: Source
    let transform: (Source.Output) throws -> Output
    
    func parse(tokens: [Token]) throws -> ParserOutput<Output> {
        return try source.parse(tokens: tokens).map(transform)
    }
}
