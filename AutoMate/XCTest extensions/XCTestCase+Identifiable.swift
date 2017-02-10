//
//  XCTestCase+Identifiable.swift
//  AutoMate
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

// MARK: - IdentifiableByElement
/// Protocol used to identify object, eg. ViewObject, in the view hierarchy.
public protocol IdentifiableByElement {

    /// Identifing `XCUIElement`.
    var identifingElement: XCUIElement { get }
}

// MARK: - XCTestCase extension
public extension XCTestCase {

    // MARK: Methods
    /// Wait for an identifiable element to exist in a view hierarchy. After given interval, if element is not found, test fails.
    ///
    /// - Parameters:
    ///   - element: XCUIElement to wait for.
    ///   - timeout: Waiting time (default: 10 seconds).
    ///   - file: Current source file.
    ///   - line: Current source line.
    public func wait<T: IdentifiableByElement>(forExistOf element: T, timeout: TimeInterval = XCTestCase.defaultTimeOut, file: StaticString = #file, line: UInt = #line) {
        wait(forExistOf: element.identifingElement, timeout: timeout, file: file, line: line)
    }

    /// Wait for an identifiable element to appear in a view hierarchy. After given interval seconds, if element is not found, test fails.
    ///
    /// - Parameters:
    ///   - element: XCUIElement to wait for.
    ///   - timeout: Waiting time (default: 10 seconds).
    ///   - file: Current source file.
    ///   - line: Current source line.
    public func wait<T: IdentifiableByElement>(forVisibilityOf element: T, timeout: TimeInterval = XCTestCase.defaultTimeOut, file: StaticString = #file, line: UInt = #line) {
        wait(forVisibilityOf: element.identifingElement, timeout: timeout, file: file, line: line)
    }
}