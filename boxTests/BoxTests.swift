//
//  boxTests.swift
//  boxTests
//
//  Created by Daniel Perez on 2015/05/03.
//  Copyright (c) 2015年 ClaudeTech. All rights reserved.
//

import UIKit
import XCTest
import box

class BoxTests: XCTestCase {
    func testEmptyBox() {
        let box = Box<String>.Empty
        XCTAssertTrue(box == Box<String>.Empty)
    }
    
    func testFullBox() {
        let box = Box<String>("foo")
        XCTAssertEqual("foo", box>!)
    }
    
    func testFailureBox() {
        let box = Box<String>(NSError(domain: "foo", code: 2, userInfo: nil))
        XCTAssertEqual("foo", box.failure!.domain)
        XCTAssertEqual(2, box.failure!.code)
    }
    
    func testIsFullBox() {
        XCTAssertTrue(Box<String>("foo").isFull())
        XCTAssertFalse(Box<()>.Empty.isFull())
        XCTAssertFalse(Box<()>(NSError(domain: "foo", code: 2, userInfo: nil)).isFull())
    }
    
    func testIsFailureBox() {
        XCTAssertFalse(Box<String>("foo").isFailure())
        XCTAssertFalse(Box<()>.Empty.isFailure())
        XCTAssertTrue(Box<()>(NSError(domain: "foo", code: 2, userInfo: nil)).isFailure())
    }
    
    func testIsEmptyBox() {
        XCTAssertFalse(Box<String>("foo").isEmpty())
        XCTAssertTrue(Box<String>.Empty.isEmpty())
        XCTAssertFalse(Box<String>(NSError(domain: "foo", code: 2, userInfo: nil)).isEmpty())
    }
    
    func testFullBoxEqual() {
        let box1 = Box<String>("foo")
        let box2 = Box<String>("foo")
        XCTAssertTrue(box1 == box2)
    }
    
    func testFullBoxNotEqual() {
        let box1 = Box<String>("foo")
        let box2 = Box<String>("bar")
        XCTAssertFalse(box1 == box2)
    }
    
    func testErrorBoxEqual() {
        let error = NSError(domain: "foo", code: 2, userInfo: nil)
        let box1 = Box<String>(error)
        let box2 = Box<String>(error)
        XCTAssertTrue(box1 == box2)
    }
    
    func testErrorBoxNotEqual() {
        let box1 = Box<String>(NSError(domain: "foo", code: 2, userInfo: nil))
        let box2 = Box<String>(NSError(domain: "bar", code: 2, userInfo: nil))
        XCTAssertFalse(box1 == box2)
    }
    
    func testEmptyEqual() {
        XCTAssertTrue(Box<String>.Empty == Box<String>.Empty)
    }
    
    func testExtractor() {
        let box = Box<String>("foo")
        XCTAssertEqual(box.value!, box>!)
    }
}
