//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/19.
//

import AppKit

public extension NSWorkspace {
    
    func isMenuBarOwningApplication(_ application: OwningApplication) -> Bool {
    
        menuBarOwningApplication?.bundleIdentifier == application.identifier
    }
}
