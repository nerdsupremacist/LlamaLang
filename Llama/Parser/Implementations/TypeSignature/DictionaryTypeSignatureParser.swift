//
//  DictionaryTypeSignatureParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Dictionary: Parsable where Key == String, Value: Parsable {
    
    static var parser: AnyParser<Dictionary<String, Value>> {
        let element = IdentifierParser() && .colon && Value.self
        let elements = element.recursvie(with: .comma).map { Dictionary($0, uniquingKeysWith: { $1 }) }
        let dictionary = elements.wrapped(by: .openBrackets, and: .closeBrackets)
        let empty = TokenParser(token: .openBrackets) && .closeBrackets
        
        return dictionary ||
            empty.map { _ in [:] }
        
    }
    
}
