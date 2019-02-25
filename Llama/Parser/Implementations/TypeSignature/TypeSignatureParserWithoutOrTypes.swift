//
//  TypeSignatureParserWithoutOrTypes.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct FunctionSignatureMustHaveReturnType: Error { }

let functionSignatureParser: AnyParser<TypeSignature> = FunctionSignature.parser.map { signature in
    guard signature.returnType != nil else { throw FunctionSignatureMustHaveReturnType() }
    return .function(signature)
}

struct TypeSignatureParserWithoutOrTypes: DelegatedParser {
    typealias Output = TypeSignature
    
    let parser: AnyParser<TypeSignature> = {
        return [String : TypeSignature].parser.map { .dictionary($0) } ||
            TypeSignature.Tuple.parser.map { .tuple($0) } ||
            TypeIdentifier.parser.map { .identifier($0) } ||
            functionSignatureParser ||
            voidParser.map { _ in .void }
    }()
}

