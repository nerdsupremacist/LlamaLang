//
//  TypeSignatureParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct FunctionSignatureMustHaveReturnType: Error { }

extension TypeSignature: Parsable {
    
    static let functionSignatureParser: AnyParser<TypeSignature> = FunctionSignature.parser.map { signature in
        guard signature.returnType != nil else { throw FunctionSignatureMustHaveReturnType() }
        return .function(signature)
    }
    
    static let parserWithoutOrType: AnyParser<TypeSignature> = [String : TypeSignature].parser.map { .dictionary($0) } ||
        TypeSignature.Tuple.parser.map { .tuple($0) } ||
        TypeIdentifier.parser.map { .identifier($0) } ||
        functionSignatureParser ||
        voidParser.map { _ in .void }
    
    // [Or]|[String : TypeSignature]|[Tuple]|[TypeIdentifier]|[FunctionSignature]|()
    static let parser: AnyParser<TypeSignature> = TypeSignature.Or.parser.map { .or($0) } || parserWithoutOrType
    
}
