//
//  TypeIdentifierParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension TypeIdentifier: Parsable {
    
    static let parser: AnyParser<TypeIdentifier> = {
        let parser = IdentifierParser() && Generics?.self
        return parser.map { TypeIdentifier(identifier: $0, generics: $1 ?? .none) }
    }()
    
}
