//
//  OrParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

func ||<A: Parser, B: Parser>(lhs: A, rhs: B) -> AnyParser<A.Output> where A.Output == B.Output {
    return OrParser(first: lhs, second: rhs).any()
}

private struct OrParser<A: Parser, B: Parser>: Parser where A.Output == B.Output {
    typealias Output = A.Output
    
    let first: A
    let second: B
    
    func parse(tokens: [Token]) throws -> ParserOutput<Output> {
        do {
            return try first.parse(tokens: tokens)
        } catch {
            return try second.parse(tokens: tokens)
        }
    }
}
