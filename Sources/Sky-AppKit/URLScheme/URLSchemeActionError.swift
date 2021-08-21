//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/08/22.
//

import Foundation

/// [Sky] An error type that occurs when invoking the assigned action.
public enum URLSchemeActionError : Error {
    
    case invalidURL(URL, description: String)
    case invocationFailure(description: String)
}
