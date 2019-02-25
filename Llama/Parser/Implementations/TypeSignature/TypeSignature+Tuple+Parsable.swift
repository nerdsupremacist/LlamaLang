//
//  TupleTypeSignatureParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension TypeSignature.Tuple: Parsable {
    
    // [TypeIdentifier](::[TypeIdentifier])*
    static let parser: AnyParser<TypeSignature.Tuple> = {
        return TypeIdentifier.parser.recursive(with: .tupleSeparator).map { TypeSignature.Tuple(types: $0) }
    }()
    
}
