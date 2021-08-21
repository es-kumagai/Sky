//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/08/21.
//

import Foundation

/// [Sky] A type expressing a URL scheme.
public protocol URLScheme {
    
    /// [Sky] The scheme part of this URL scheme.
    static var scheme: String { get }
    
    /// [Sky] The host part of this URL scheme.
    static var host: String { get }
    
    /// [Sky] Execute the process assigned this URL scheme.
    /// - Parameter url: The url that matched this URL scheme.
    static func action(url: URL)
}

extension URLScheme {
    
    /// [Sky] Returns whether the `url` matches this URL scheme.
    /// - Parameter url: The URL to determine if this URL scheme matches.
    /// - Returns: True iff this URL scheme matches the `url`, otherwise false.
    public static func matches(_ url: URL) -> Bool {
        
        url.scheme == scheme && url.host == host
    }
}
