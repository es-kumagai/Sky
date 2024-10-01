//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/19.
//

/// [Sky] An owning application that expressed by a bundle identifier.
public struct OwningApplication: Sendable {
    
    /// [Sky] The bundle identifier of this instance.
    public let identifier: String
}

/// [Sky] A set of owning applications.
public typealias OwningApplications = Set<OwningApplication>

extension OwningApplication : CustomDebugStringConvertible {
    
    public var debugDescription: String {
        
        identifier
    }
}

extension OwningApplication : Hashable {
    
}
