//
//  Array+Parsable.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Array: Parsable where Element: Parsable {
    
    static var parser: AnyParser<Array<Element>> {
        return Element.parser*
    }
    
}
