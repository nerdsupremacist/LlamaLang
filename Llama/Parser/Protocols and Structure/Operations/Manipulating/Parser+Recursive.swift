//
//  RecusriveParser.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {
    
    // [Self]([Separator][Self])*
    func recursive(with separator: Token) -> AnyParser<[Output]> {
        let subsequent = separator && self
        let parser = self && subsequent*
        return parser.map { [$0] + $1 }
    }
    
}
