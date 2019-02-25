//
//  FunctionSignature+Arguments+Parsable.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension FunctionSignature.Arguments: Parsable {
    
    // (([Argument](,[Argument])*)?)
    static let parser: AnyParser<FunctionSignature.Arguments> = {
        let parser = .openParenthesis && FunctionSignature.Argument.parser.recursive(with: .comma).? && .closeParenthesis
        return parser.map { FunctionSignature.Arguments(arguments: $0 ?? []) }
    }()
    
}
