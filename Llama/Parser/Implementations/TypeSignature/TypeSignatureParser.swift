//
//  TypeSignatureParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension TypeSignature: Parsable {
    
    static let parser: AnyParser<TypeSignature> = {
        return TypeSignature.Or.parser.map { .or($0) } ||
            TypeSignatureParserWithoutOrTypes()
    }()
    
}
