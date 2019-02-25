//
//  Optional+Parsable.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Optional: Parsable where Wrapped: Parsable {
    
    static var parser: AnyParser<Wrapped?> {
        return Wrapped.parser.?
    }
    
}
