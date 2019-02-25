//
//  DictionaryTypeSignatureParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Dictionary: Parsable where Key == String, Value: Parsable {
    
    // { ([Identifier]:[Value](,[Identifier]:[Value])*)? }
    static var parser: AnyParser<Dictionary<String, Value>> {
        let element = IdentifierParser() && .colon && Value.self
        return element
            .recursive(with: .comma)
            .map { Dictionary($0, uniquingKeysWith: { $1 }) }
            .optional()
            .wrapped(by: .brackets)
            .map { $0 ?? [:] }
    }
    
}
