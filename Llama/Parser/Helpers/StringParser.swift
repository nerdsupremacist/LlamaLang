//
//  StringParser.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct ExpectedString: Error {
    let received: Token
}

struct StringParser: SingleTokenParser {
    typealias Output = String
    
    func parse(token: Token) throws -> String {
        guard case .string(let string) = token else { throw ExpectedString(received: token) }
        return string
    }
}
