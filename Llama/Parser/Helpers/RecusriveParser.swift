//
//  RecusriveParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {
    
    func recursvie(with separator: Token) -> AnyParser<[Output]> {
        return RecursiveParser(source: self, separator: separator).any()
    }
    
}

private struct RecursiveParser<Source: Parser>: DelegatedParser {
    typealias Output = [Source.Output]
    let source: Source
    let separator: Token
    
    var parser: AnyParser<[Source.Output]> {
        let subsequent = separator && source
        let parser = source && subsequent*
        return parser.map { [$0] + $1 }
    }
}
