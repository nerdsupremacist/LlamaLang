//
//  ConstantDefinitionParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension ConstantDefinition: Parsable {
    
    static let parser: AnyParser<ConstantDefinition> = {
        let parser = .constantDefinition &&
            IdentifierParser() &&
            .equals &&
            Value.self
        
        return parser.map { ConstantDefinition(name: $0, value: $1) }
    }()
    
}
