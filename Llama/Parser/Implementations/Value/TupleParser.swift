//
//  TupleParser.swift
//  Llama
//
//  Created by Mathias Quintero on 25.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

struct TupleMustContainAtLeastTwoElements: Error { }

extension Value.Tuple: Parsable {
    
    static let parser: AnyParser<Value.Tuple> = {
        return Value.memberOfTupleParser.recursvie(with: .tupleSeparator).map { values in
            guard values.count > 1 else { throw TupleMustContainAtLeastTwoElements() }
            return Value.Tuple(values: values)
        }
    }()
    
}
