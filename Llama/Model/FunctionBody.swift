//
//  FunctionBody.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

indirect enum FunctionBody {
    
    struct IfElse {
        let condition: Value
        let trueBranch: Value
        let falseBranch: Value
    }
    
    struct Chained {
        let innerConstant: ConstantDefinition
        let body: FunctionBody
    }
    
    case chained(Chained)
    case matching(PatternMatching)
    case ifelse(IfElse)
    case value(Value)
}
