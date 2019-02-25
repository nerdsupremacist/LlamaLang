//
//  NumberParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct ExpectedNumber: Error {
    let received: Token
}

struct NumberParser: SingleTokenParser {
    
    typealias Output = Double
    
    func parse(token: Token) throws -> Double {
        guard case .number(let number) = token else { throw ExpectedNumber(received: token) }
        return number
    }
}
