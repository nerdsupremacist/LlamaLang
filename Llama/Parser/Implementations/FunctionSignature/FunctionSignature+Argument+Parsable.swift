//
//  FunctionArgumentsParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension FunctionSignature.Argument: Parsable {
    
    // [ArgumentIdentifier](: TypeIdentifier)?
    static let parser: AnyParser<FunctionSignature.Argument> = {
        let typeInformtion = .colon && TypeIdentifier.self
        let parser = FunctionSignature.Argument.Identifier.self && typeInformtion.?
        return parser.map { FunctionSignature.Argument(identifier: $0, type: $1) }
    }()
    
}
