//
//  FunctionArgumentsParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension FunctionSignature.Argument.Identifier: Parsable {
    
    static let parser: AnyParser<FunctionSignature.Argument.Identifier> = {
        let withoutLabel = .underscore && IdentifierParser()
        let labelAndName = IdentifierParser() && IdentifierParser()
        
        return withoutLabel.map { .withoutLabel($0) } ||
            labelAndName.map { .labelAndName($0, $1) } ||
            IdentifierParser().map { .name($0) }
    }()
    
}

extension FunctionSignature.Argument: Parsable {
    
    static let parser: AnyParser<FunctionSignature.Argument> = {
        let typeInformtion = .colon && TypeIdentifier.self
        let parser = FunctionSignature.Argument.Identifier.self && typeInformtion.?
        return parser.map { FunctionSignature.Argument(identifier: $0, type: $1) }
    }()
    
}

extension FunctionSignature.Arguments: Parsable {
    
    static let parser: AnyParser<FunctionSignature.Arguments> = {
        let parser = .openParenthesis && FunctionSignature.Argument.parser.recursvie(with: .comma).? && .closeParenthesis
        return parser.map { FunctionSignature.Arguments(arguments: $0 ?? []) }
    }()
    
}
