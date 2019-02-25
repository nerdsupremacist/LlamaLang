//
//  PatternMatching+Case+Match.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension PatternMatching.Case.Match: Parsable {
    
    // [Identifier](::[Identifier])*|()|_
    static let parser: AnyParser<PatternMatching.Case.Match> = {
        return IdentifierParser().recursive(with: .tupleSeparator).map { .tuple($0) } ||
            voidParser.map { _ in .void } ||
            TokenParser(token: .underscore).map { .default }
    }()
    
}
