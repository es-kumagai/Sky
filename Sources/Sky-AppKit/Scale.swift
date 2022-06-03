//
//  File.swift
//  
//  
//  Created by Tomohiro Kumagai on 2022/06/03
//  
//

import AppKit
import Ocean
import Sky_Base

extension NSWindow : HavingScale {
    
    public var scale: CGScale {
        
        Scale(backingScaleFactor)
    }
}

extension NSView : HavingScale {
    
    public var scale: CGScale {
        
        (window?.backingScaleFactor).map(Scale.init) ?? .actual
    }
}

