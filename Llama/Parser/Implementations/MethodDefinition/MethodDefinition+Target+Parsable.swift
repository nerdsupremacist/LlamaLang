//
//  MethodDefinition+Target+Parsable.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension MethodDefinition.Target: Parsable {
    
    // [String : TypeSignature][Generics]?
    private static let dictionaryParser: AnyParser<([String : TypeSignature], Generics)> = {
        return [String : TypeSignature].self &&
            Generics?.parser.map { $0 ?? .none }
    }()
    
    // [TypeIdentifier]|[String : TypeSignature][Generics]?
    static let parser: AnyParser<MethodDefinition.Target> = {
        return TypeIdentifier.parser.map { MethodDefinition.Target.identifier($0) } ||
            dictionaryParser.map { MethodDefinition.Target.object($0, $1) }
    }()
    
}
