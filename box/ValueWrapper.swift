//
//  ValueWrapper.swift
//  box
//
//  Created by Daniel Perez on 2015/05/03.
//  Copyright (c) 2015 ClaudeTech. All rights reserved.
//

import Foundation

public class ValueWrapper <T> {
    private var t: T
    init(_ value: T) {
        t = value
    }
    
    var value: T {
        return t
    }
    
    var v: T {
        return t
    }
}

public func == <T: Equatable>(left: ValueWrapper<T>, right: ValueWrapper<T>) -> Bool {
    return left.value == right.value
}