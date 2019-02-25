//
//  AndParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

func &&<A: Parser, B: Parser>(lhs: A, rhs: B) -> AnyParser<(A.Output, B.Output)> {
    return AndParser(first: lhs, second: rhs).any()
}

func &&<A: Parser, B: Parser>(lhs: A, rhs: B) -> AnyParser<A.Output> where B.Output == Void {
    return (lhs && rhs).map { result, _ in result }
}

func &&<A: Parser, B: Parser>(lhs: A, rhs: B) -> AnyParser<B.Output> where A.Output == Void {
    return (lhs && rhs).map { _, result in result }
}

func &&<A: Parsable, B: Parsable>(lhs: A.Type, rhs: B.Type) -> AnyParser<(A, B)> {
    return lhs.indirect && rhs.indirect
}

func &&<A: Parsable, B: Parser>(lhs: A.Type, rhs: B) -> AnyParser<(A, B.Output)> {
    return lhs.indirect && rhs
}

func &&<A: Parser, B: Parsable>(lhs: A, rhs: B.Type) -> AnyParser<(A.Output, B)> {
    return lhs && rhs.indirect
}

func &&<A: Parser>(lhs: Token, rhs: A) -> AnyParser<A.Output> {
    return TokenParser(token: lhs) && rhs
}

func &&<A: Parser>(lhs: A, rhs: Token) -> AnyParser<A.Output> {
    return lhs && TokenParser(token: rhs)
}

func &&<A: Parsable>(lhs: Token, rhs: A.Type) -> AnyParser<A> {
    return TokenParser(token: lhs) && rhs.indirect
}

func &&<A: Parsable>(lhs: A.Type, rhs: Token) -> AnyParser<A> {
    return lhs.indirect && TokenParser(token: rhs)
}

private struct AndParser<A: Parser, B: Parser>: Parser {
    typealias Output = (A.Output, B.Output)
    
    let first: A
    let second: B
    
    func parse(tokens: [Token]) throws -> ParserOutput<(A.Output, B.Output)> {
        let firstOutput = try first.parse(tokens: tokens)
        return try second.parse(tokens: firstOutput.remaining).map { (firstOutput.output, $0) }
    }
}
