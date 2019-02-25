//
//  OrTypeSignatureParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension TypeSignature.Or: Parsable {
    
    // [TypeSignature]|[TypeSignature]
    static let parser: AnyParser<TypeSignature.Or> = {
        let parser = TypeSignature.parserWithoutOrType &&
            .case &&
            TypeSignature.self
        
        return parser.map { TypeSignature.Or(first: $0, second: $1) }
    }()
    
}
