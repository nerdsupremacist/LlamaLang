//
//  ChainedFunctionBodyParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension FunctionBody.Chained: Parsable {
    
    // [ConstantDefinition];[FunctionBody]
    static let parser: AnyParser<FunctionBody.Chained> = {
        let parser = ConstantDefinition.self && .semicolon && FunctionBody.self
        return parser.map { FunctionBody.Chained(innerConstant: $0, body: $1) }
    }()
    
}
