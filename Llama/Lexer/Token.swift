//
//  Token.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

enum Token: Equatable {
    case openParenthesis
    case closeParenthesis
    case openBrackets
    case closeBrackets
    case openGeneric
    case closeGeneric
    
    case equals
    case tupleSeparator
    case comma
    case dot
    case colon
    case semicolon
    case underscore
    
    case `if`
    case `else`
    case match
    case with
    case arrow
    case `case`
    
    case typeDefinition
    case constantDefinition
    
    case identifier(String)
    case number(Double)
    case string(String)
    case `operator`(String)
}
