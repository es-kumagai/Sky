//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/19.
//

import AppKit
import Swim

public extension NSWorkspace {
    
    func isMenuBarOwningApplication(_ application: OwningApplication) -> Bool {
    
        menuBarOwningApplication?.bundleIdentifier == application.identifier
    }
    
    func isMenuBarAnyOfOwningApplications(_ applications: OwningApplication...) -> Bool {
        
        isMenuBarAnyOfOwningApplications(applications)
    }

    func isMenuBarAnyOfOwningApplications(_ applications: [OwningApplication]) -> Bool {
        
        guard let bundleIdentifier = menuBarOwningApplication?.bundleIdentifier else {
            
            return false
        }
        
        return applications.meetsAny { $0.identifier == bundleIdentifier }
    }
}
