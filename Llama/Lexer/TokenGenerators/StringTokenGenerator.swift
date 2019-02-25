//
//  StringTokenGenerator.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct StringTokenGenerator: RegexTokenGenerator {
    
    var pattern: String {
        return "\"([^\"]|\\.)*\""
    }
    
    func token(from matched: String) throws -> Token? {
        guard matched.count > 1 else { fatalError("String Literal is somehow smaller than the quotation marks") }
        let range = matched.index(after: matched.startIndex)..<matched.index(before: matched.endIndex)
        return .string(String(matched[range]))
    }
    
}
