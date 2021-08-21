//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/08/21.
//

import Foundation

public extension NSAppleEventDescriptor {
    
    /// [Sky] The url sent by this apple event.
    var url: URL? {
        
        paramDescriptor(forKeyword: AEKeyword(keyDirectObject))?.stringValue.flatMap(URL.init(string:))
    }
}
