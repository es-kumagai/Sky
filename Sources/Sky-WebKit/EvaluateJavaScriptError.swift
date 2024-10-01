//
//  EvaluateJavaScriptError.swift
//  Sky
//  
//  Created by Tomohiro Kumagai on 2024/10/01
//  
//

import Foundation
import Swim

public struct EvaluateJavaScriptError: LocalizedError {
    
    public let rawError: NSError
    
    public init(_ error: NSError) {
        
        guard error.domain == Self.errorDomain else {
            fatalError("Unexpected error domain: \(error.domain)")
        }
        
        rawError = error
    }
    
    public init(_ error: some Error) {
        self.init(error as NSError)
    }

    @StringConcat
    public var exceptionLineNumber: String {
        
        if let lineNumber = rawError.userInfo["WKJavaScriptExceptionLineNumber"] as? Int {
            lineNumber
        } else {
            "Unknown line number"
        }
    }
    
    @StringConcat
    public var exceptionColumnNumber: String {
        
        if let columnNumber = rawError.userInfo["WKJavaScriptExceptionColumnNumber"] as? Int {
            columnNumber
        } else {
            "Unknown column number"
        }
    }
    
    public var exceptionSourcePath: String {
        
        if let url = rawError.userInfo["WKJavaScriptExceptionSourceURL"] as? URL {
            url.path(percentEncoded: false)
        } else {
            "Unknown source"
        }
    }
    
    public var exceptionMessage: String {
        
        if let message = rawError.userInfo["WKJavaScriptExceptionMessage"] as? String {
            message
        } else {
            "Unkown error."
        }
    }
    
    @StringConcat
    public var errorDescription: String? {
        
        rawError.localizedDescription
        ":"
        exceptionLineNumber
        ":"
        exceptionColumnNumber
        ":"
        exceptionSourcePath
        ":"
        exceptionMessage
    }
}

extension EvaluateJavaScriptError: CustomStringConvertible {

    public var description: String {
        localizedDescription
    }
}

extension EvaluateJavaScriptError: CustomNSError {
    
    public static var errorDomain: String {
        "WKErrorDomain"
    }
    
    public var errorCode: Int {
        rawError.code
    }
    
    public var errorUserInfo: [String: Any] {
        rawError.userInfo
    }
}

