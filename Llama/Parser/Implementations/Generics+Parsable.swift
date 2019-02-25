//
//  GenericsParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Generics: Parsable {
    
    // <[Identifier](,[Identifier])*>
    static let parser: AnyParser<Generics> = IdentifierParser()
        .recursive(with: .comma)
        .wrapped(by: .generics)
        .map { Generics(arguments: $0 ) }
    
}
