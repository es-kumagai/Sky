//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/19.
//

import Foundation

public extension FileManager {
    
    /// [Sky] The url of the system library.
    static var systemLibraryURL: URL {
        
        URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.libraryDirectory, [.systemDomainMask], true).first!)
    }
}
