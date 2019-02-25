//
//  FunctionSignatureParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

private let returnTypeParser = .arrow && TypeIdentifier.self

extension FunctionSignature: Parsable {
    
    // [Arguments](-> [TypeIdentifier])?
    static let parser: AnyParser<FunctionSignature> = {
        let parser = Arguments?.self &&
            returnTypeParser.?
        
        return parser.map { FunctionSignature(arguments: $0 ?? .none, returnType: $1) }
    }()
    
}
