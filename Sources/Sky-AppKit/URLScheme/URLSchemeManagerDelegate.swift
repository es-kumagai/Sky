//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/08/21.
//

import Foundation

/// [Sky] A set of methods you implement in URLSchemeManager to customize the behavior of handling.
@objc(ESURLSchemeManagerDelegate) public protocol URLSchemeManagerDelegate : AnyObject {
    
    /// [Sky] Invokes this method when the `scheme` did handle.
    /// - Parameters:
    ///   - manager: The URL scheme manager that handled `scheme`.
    ///   - scheme: The URL scheme that handled by `manager`.
    ///   - error: The error if an error occurs during executing `scheme`'s action.
    @objc optional func urlSchemeManager(_ manager: URLSchemeManager, schemeDidHandle scheme: URLScheme.Type, errorIfOccurs error: Error?)
    
    /// [Sky] Invokes when some `url` scheme detected by URL scheme `manager`.
    /// - Parameters:
    ///   - manager: The URL scheme manager that detects some `url` scheme.
    ///   - url: The url that was detected by `manager`.
    @objc optional func urlSchemeManager(_ manager: URLSchemeManager, someURLSchemeDetected url: URL)
    
    /// [Sky] Invokes when the handling process did finish by `manager` with `matchingCount`.
    /// - Parameters:
    ///   - manager: The manager that executed the handling process.
    ///   - matchingCount: How many schemes matched a detected url.
    @objc optional func urlSchemeManager(_ manager: URLSchemeManager, handlingDidFinishWithMatchingCount matchingCount: Int)
}
