//
//  TypeDefinitionParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension TypeDefinition: Parsable {
    
    static let parser: AnyParser<TypeDefinition> = {
        let parser = .typeDefinition &&
            TypeIdentifier.self &&
            .equals &&
            TypeSignature.self
        
        return parser.map { TypeDefinition(identifier: $0, signature: $1) }
    }()
    
}
