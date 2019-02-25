//
//  FunctionDefinition.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct MethodDefinition {
    
    enum Target {
        case identifier(TypeIdentifier)
        case object([String : TypeSignature], Generics)
    }
    
    let target: Target
    let name: String
    let generics: Generics
    let signature: FunctionSignature
    let body: FunctionBody
}
