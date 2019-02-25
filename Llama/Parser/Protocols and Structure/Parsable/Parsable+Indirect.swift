//
//  Parsable+Indirect.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parsable {
    
    static var indirect: AnyParser<Self> {
        return IndirectParsable<Self>().any()
    }
    
}

private struct IndirectParsable<P: Parsable>: DelegatedParser {
    typealias Output = P
    
    var parser: AnyParser<P> {
        return P.parser
    }
}
