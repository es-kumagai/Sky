//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/08/21.
//

import Foundation

/// [Sky] A set of methods you implement in URLSchemeManager to customize the behavior of handling.
public protocol URLSchemeManagerDelegate : AnyObject {
    
    /// [Sky] Invokes this method when the `scheme` did handle.
    /// - Parameters:
    ///   - manager: The URL scheme manager that handled `scheme`.
    ///   - scheme: The URL scheme that handled by `manager`.
    func urlSchemeManager(_ manager: URLSchemeManager, schemeDidHandle scheme: URLScheme.Type)
    
    /// [Sky] Invokes when some `url` scheme detected by URL scheme `manager`.
    /// - Parameters:
    ///   - manager: The URL scheme manager that detects some `url` scheme.
    ///   - url: The url that was detected by `manager`.
    func urlSchemeManager(_ manager: URLSchemeManager, someURLSchemeDetected url: URL)
}
