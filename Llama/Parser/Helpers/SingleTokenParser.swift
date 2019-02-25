//
//  SingleTokenParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct NoMoreTokensError: Error { }

protocol SingleTokenParser: Parser {
    func parse(token: Token) throws -> Output
}

extension SingleTokenParser {
    
    func parse(tokens: [Token]) throws -> ParserOutput<Output> {
        guard let token = tokens.first else { throw NoMoreTokensError() }
        let output = try parse(token: token)
        return ParserOutput(output: output, remaining: Array(tokens.dropFirst()))
    }
    
}
