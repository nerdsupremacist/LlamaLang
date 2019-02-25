//
//  FunctionBodyParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension FunctionBody: Parsable {
    static let parser: AnyParser<FunctionBody> = {
        return Chained.parser.map { .chained($0) } ||
            PatternMatching.parser.map { .matching($0) } ||
            IfElse.parser.map { .ifelse($0) } ||
            Value.parser.map { .value($0) }
    }()
}
