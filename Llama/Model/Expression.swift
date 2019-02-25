//
//  Expression.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

enum Expression {
    case constant(ConstantDefinition)
    case type(TypeDefinition)
    case method(MethodDefinition)
    case value(Value)
}
