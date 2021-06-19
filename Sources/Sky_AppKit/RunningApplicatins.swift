//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/19.
//

import AppKit

public extension NSWorkspace {
    
    /// Returns running applications that has the bundle identifier specified by `bundleIdentifier`.
    /// - Parameter bundleIdentifier: A bundle identifier to specify running applications.
    /// - Returns: Running applications.
    func runningApplications(havingBundleIdentifier bundleIdentifier: String) -> Array<NSRunningApplication> {
        
        runningApplications.filter {
            
            $0.bundleIdentifier == bundleIdentifier
        }
    }
}
