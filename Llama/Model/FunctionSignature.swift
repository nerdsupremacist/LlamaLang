//
//  FunctionSignature.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct FunctionSignature {
    
    struct Argument {
        
        enum Identifier {
            case name(String)
            case labelAndName(String, String)
            case withoutLabel(String)
        }
        
        let identifier: Identifier
        let type: TypeIdentifier?
    }
    
    struct Arguments {
        let arguments: [Argument]
    }
    
    let arguments: Arguments
    let returnType: TypeIdentifier?
}

extension FunctionSignature.Arguments {
    
    static let none = FunctionSignature.Arguments(arguments: [])
    
}
