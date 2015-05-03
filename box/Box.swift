//
//  Box.swift
//  box
//
//  Created by Daniel Perez on 2015/05/03.
//  Copyright (c) 2015 ClaudeTech. All rights reserved.
//

import Foundation

public enum Box<T> {
    case Full(ValueWrapper<T>)
    case Failure(NSError)
    case Empty
    
    public init(_ value: T) {
        self = .Full(ValueWrapper(value))
    }
    
    public init(_ failure: NSError) {
        self = .Failure(failure)
    }
    
    public var value: T? {
        switch self {
        case .Full(let v):
            return v.value
        default:
            return nil
        }
    }
    
    public var failure: NSError? {
        switch self {
        case .Failure(let e):
            return e
        default:
            return nil
        }
    }
    
    public func isFull() -> Bool {
        return value != nil
    }
    
    public func isFailure() -> Bool {
        return failure != nil
    }
    
    public func isEmpty() -> Bool {
        return !isFailure() && !isFull()
    }
}

public func == <T: Equatable>(left: Box<T>, right: Box<T>) -> Bool {
    switch (left, right) {
    case (.Full(let v1), .Full(let v2)):
        return v1 == v2
    case (.Failure(let e1), .Failure(let e2)):
        return e1 == e2
    case (.Empty, .Empty):
        return true
    default:
        return false
    }
}

postfix operator >! {}

public postfix func >!<T>(box: Box<T>) -> T {
    return box.value!
}
