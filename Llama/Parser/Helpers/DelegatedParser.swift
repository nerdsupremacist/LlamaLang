//
//  DelegatedParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

protocol DelegatedParser: Parser {
    var parser: AnyParser<Output> { get }
}

extension DelegatedParser {
    
    func parse(tokens: [Token]) throws -> ParserOutput<Output> {
        return try parser.parse(tokens: tokens)
    }
    
}
