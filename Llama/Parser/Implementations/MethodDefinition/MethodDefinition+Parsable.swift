//
//  MethodDefinitionParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension MethodDefinition: Parsable {
    
    // [Target].[Identifier][Generics]?[FunctionSignature] = [FunctionBody]
    static let parser: AnyParser<MethodDefinition> = {
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
