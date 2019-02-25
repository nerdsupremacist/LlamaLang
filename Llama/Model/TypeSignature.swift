//
//  TypeSignature.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

indirect enum TypeSignature {
    
    struct Or {
        let first: TypeSignature
        let second: TypeSignature
    }
    
    struct Tuple {
        let types: [TypeIdentifier]
    }
    
    case dictionary([String : TypeSignature])
    case identifier(TypeIdentifier)
    case or(Or)
    case tuple(Tuple)
    case function(FunctionSignature)
    case void
}
