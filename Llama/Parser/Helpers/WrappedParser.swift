//
//  WrappedParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {
    
    func wrapped(by start: Token, and end: Token) -> AnyParser<Output> {
        return WrappedParser(source: self, start: start, end: end).any()
    }
    
}

private struct WrappedParser<Source: Parser>: DelegatedParser {
    typealias Output = Source.Output
    
    let source: Source
    let start: Token
    let end: Token
    
    var parser: AnyParser<Output> {
        return start && source && end
    }
}
