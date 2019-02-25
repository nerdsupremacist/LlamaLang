//
//  Lexer.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

private let tokenGenerator: TokenGenerator = [
    EmptyContentTokenGenerator(),
    OpenParenthesisTokenGenerator(),
    CloseParenthesisTokenGenerator(),
    OpenBracketsTokenGenerator(),
    CloseBracketsTokenGenerator(),
    OpenGenericTokenGenerator(),
    CloseGenericTokenGenerator(),
    EqualsTokenGenerator(),
    TupleSeparatorTokenGenerator(),
    CommaTokenGenerator(),
    DotTokenGenerator(),
    ColonTokenGenerator(),
    SemicolonTokenGenerator(),
    UnderscoreTokenGenerator(),
    IfTokenGenerator(),
    ElseTokenGenerator(),
    MatchTokenGenerator(),
    WithTokenGenerator(),
    ArrowTokenGenerator(),
    CaseTokenGenerator(),
    TypeDefinitionTokenGenerator(),
    ConstantDefinitionTokenGenerator(),
    IdentifierTokenGenerator(),
    NumberTokenGenerator(),
    StringTokenGenerator(),
    OperatorTokenGenerator(),
]

struct LexerCouldNotDecode: Error {
    let character: Character?
}

enum Lexer {
    
    static func tokenize(input: String) throws -> [Token] {
        return try tokenize(input: input).compactMap { $0 }
    }
    
    private static func tokenize(input: String) throws -> [Token?] {
        let generated = try tokenGenerator.take(text: input)
        guard let remaining = generated.remainingString else { return [generated.token] }
        guard remaining.count != input.count else { throw LexerCouldNotDecode(character: remaining.first) }
        let rest = try tokenize(input: remaining) as [Token?]
        return [generated.token] + rest
    }
    
}
