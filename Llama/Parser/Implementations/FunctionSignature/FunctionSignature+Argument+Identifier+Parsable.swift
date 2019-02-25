//
//  FunctionSignature+Argument+Identifier+Parsable.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension FunctionSignature.Argument.Identifier: Parsable {
    
    // (_ [Identifier])|([Identifier] [Identifier])|[Identifier]
    static let parser: AnyParser<FunctionSignature.Argument.Identifier> = {
        let withoutLabel = .underscore && IdentifierParser()
        let labelAndName = IdentifierParser() && IdentifierParser()
        
        return withoutLabel.map { .withoutLabel($0) } ||
            labelAndName.map { .labelAndName($0, $1) } ||
            IdentifierParser().map { .name($0) }
    }()
    
}
