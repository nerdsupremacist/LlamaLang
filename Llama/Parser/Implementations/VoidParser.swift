//
//  VoidParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

let voidParser = TokenParser(token: .openParenthesis) && .closeParenthesis
