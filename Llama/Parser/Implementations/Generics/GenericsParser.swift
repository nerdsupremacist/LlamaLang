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
    static let parser: AnyParser<Generics> = {
        return IdentifierParser()
            .recursvie(with: .comma)
            .wrapped(by: .openGeneric, and: .closeGeneric)
            .map { Generics(arguments: $0 ) }
    }()
    
}
