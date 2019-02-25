//
//  Value.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

indirect enum Value {
    // TODO: Add method call
    
    struct Operation {
        let `operator`: String
        let lhs: Value
        let rhs: Value
    }
    
    struct Function {
        let arguments: FunctionSignature.Arguments
        let body: FunctionBody
    }
    
    struct FunctionCall {
        
        struct Argument {
            let label: String?
            let value: Value
        }
        
        struct Arguments {
            let arguments: [Argument]
        }
        
        let name: String
        let arguments:  Arguments
    }
    
    struct MemberCall {
        
        enum Selector {
            case property(String)
            case method(FunctionCall)
        }
        
        let value: Value
        let members: [Selector]
    }
    
    struct Tuple {
        let values: [Value]
    }
    
    case object([String : Value])
    case variable(String)
    case number(Double)
    case string(String)
    case operation(Operation)
    case function(Function)
    case tuple(Tuple)
    case wrapped(Value)
    case functionCall(FunctionCall)
    case methodCall(MemberCall)
    case void
}
