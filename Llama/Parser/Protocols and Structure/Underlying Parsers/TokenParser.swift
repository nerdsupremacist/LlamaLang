//
//  SpecificTokenParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct UnexpectedToken: Error {
    let token: Token
    let expected: Token
}

struct TokenParser: SingleTokenParser {
    typealias Output = Void
    let token: Token
    
    func parse(token: Token) throws -> Void {
        guard token == self.token else { throw UnexpectedToken(token: token, expected: self.token) }
    }
}
