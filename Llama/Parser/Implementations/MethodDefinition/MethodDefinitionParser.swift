//
//  MethodDefinitionParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension MethodDefinition.Target: Parsable {
    
    static let dictionaryParser: AnyParser<([String : TypeSignature], Generics)> = {
        return [String : TypeSignature].self &&
            Generics?.parser.map { $0 ?? .none }
    }()
    
    static let parser: AnyParser<MethodDefinition.Target> = {
        return TypeIdentifier.parser.map { MethodDefinition.Target.identifier($0) } ||
            dictionaryParser.map { MethodDefinition.Target.object($0, $1) }
    }()
    
}

extension MethodDefinition: Parsable {
    
    static let parser: AnyParser<MethodDefinition> = {
        // TODO: Deal with generics added to type identifier
        let parser = MethodDefinition.Target.self &&
            .dot &&
            IdentifierParser() &&
            Generics?.self &&
            FunctionSignature.self &&
            .equals &&
            FunctionBody.self
        
        return parser.map { MethodDefinition(target: $0.0.0.0,
                                             name: $0.0.0.1,
                                             generics: $0.0.1 ?? .none,
                                             signature: $0.1,
                                             body: $1) }
    }()
    
}
