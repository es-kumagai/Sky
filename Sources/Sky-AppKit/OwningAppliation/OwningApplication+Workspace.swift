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

    func isMenuBarAnyOfOwningApplications<Applications : Sequence>(_ applications: Applications) -> Bool where Applications.Element == OwningApplication {
        
        guard let bundleIdentifier = menuBarOwningApplication?.bundleIdentifier else {
            
            return false
        }

        return applications.contains { $0.identifier == bundleIdentifier }
    }

    func isMenuBarAnyOfOwningApplications(_ applications: OwningApplications) -> Bool {
        
        guard let application = menuBarOwningApplication?.bundleIdentifier.map(OwningApplication.init) else {
            
            return false
        }
        
        return applications.contains(application)
    }
}
