//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/20.
//

import Carbon
import Ocean

extension InputMethod {
    
    public struct InputSource {
        
        public var rawValue: TISInputSource
    }
}

private extension TISInputSource {
    
    subscript(key: CFString) -> UnsafeMutableRawPointer! {
        
        TISGetInputSourceProperty(self, key)
    }
}

public extension InputMethod.InputSource {
    
    var id: String {
        
        String(cfStringRef: rawValue[kTISPropertyInputSourceID])
    }
    
    var localizedName: String {
        
        String(cfStringRef: rawValue[kTISPropertyLocalizedName])
    }
    
    var type: String {
        
        String(cfStringRef: rawValue[kTISPropertyInputSourceType])
    }
    
    var category: String {
        
        String(cfStringRef: rawValue[kTISPropertyInputSourceCategory])
    }
    
    var languages: Array<String> {
        
        Array<String>(cfArrayRef: rawValue[kTISPropertyInputSourceLanguages])
    }

    var isSelected: Bool {
        
        Bool(cfBooleanRef: rawValue[kTISPropertyInputSourceIsSelected])
    }
    
    var isEnabled: Bool {
        
        Bool(cfBooleanRef: rawValue[kTISPropertyInputSourceIsEnabled])
    }

    var isASCIICapable: Bool {
        
        Bool(cfBooleanRef: rawValue[kTISPropertyInputSourceIsASCIICapable])
    }
    
    var isEnableCapable: Bool {
        
        Bool(cfBooleanRef: rawValue[kTISPropertyInputSourceIsEnableCapable])
    }

    var isSelectCapable: Bool {
        
        Bool(cfBooleanRef: rawValue[kTISPropertyInputSourceIsSelectCapable])
    }
}

extension InputMethod.InputSource : CustomDebugStringConvertible {
    
    public var debugDescription: String {
        
        "\(id) (\(localizedName))"
    }
}

extension InputMethod.InputSource : Hashable {
    
}
