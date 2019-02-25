//
//  IdentifierParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct ExpectedIdentifier: Error {
    let received: Token
}

struct IdentifierParser: SingleTokenParser {
    typealias Output = String
    
    func parse(token: Token) throws -> String {
        guard case .identifier(let identifier) = token else { throw ExpectedIdentifier(received: token) }
        return identifier
    }
}
