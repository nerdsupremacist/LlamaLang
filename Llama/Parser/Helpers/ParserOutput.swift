//
//  ParserOutput.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct ParserOutput<T> {
    let output: T
    let remaining: [Token]
}

extension ParserOutput {
    
    func map<V>(_ transform: (T) throws -> V) rethrows -> ParserOutput<V> {
        return ParserOutput<V>(output: try transform(output), remaining: remaining)
    }
    
}
