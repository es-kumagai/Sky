//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/20.
//

import Carbon

public final class InputMethod {
    
    public func inputSources(includeAllInstalled: Bool = false) -> Array<InputSource> {
        
        inputSources(withProperties: nil, includeAllInstalled: includeAllInstalled)
    }

    public func inputSources(havingInputSourceID inputSourceID: String, includeAllInstalled: Bool = false) -> Array<InputSource> {
        
        let properties = [kTISPropertyInputSourceID : inputSourceID]
        
        return inputSources(withProperties: properties as CFDictionary, includeAllInstalled: includeAllInstalled)
    }

    public func inputSources(havingLocalizedName localizedName: String, includeAllInstalled: Bool = false) -> Array<InputSource> {
        
        let properties = [kTISPropertyLocalizedName : localizedName]
        
        return inputSources(withProperties: properties as CFDictionary, includeAllInstalled: includeAllInstalled)
    }
    
    public var currentInputSource: InputSource {
        
        InputSource(rawValue: TISCopyCurrentKeyboardInputSource().takeRetainedValue())
    }
    
    @discardableResult
    public func select(inputSource: InputSource) -> Bool {
        
        TISSelectInputSource(inputSource.rawValue) == noErr
    }
    
    @discardableResult
    public func deselect(inputSource: InputSource) -> Bool {
        
        TISDeselectInputSource(inputSource.rawValue) == noErr
    }
    
    @discardableResult
    public func enable(inputSource: InputSource) -> Bool {
        
        TISEnableInputSource(inputSource.rawValue) == noErr
    }
    
    @discardableResult
    public func disable(inputSource: InputSource) -> Bool {
        
        TISDisableInputSource(inputSource.rawValue) == noErr
    }
}

private extension InputMethod {
    
    func inputSources(withProperties properties: CFDictionary!, includeAllInstalled: Bool = false) -> Array<InputSource> {
        
        guard let list = TISCreateInputSourceList(properties, includeAllInstalled) else {
        
            return []
        }
        
        let inputSources = list.takeRetainedValue() as! Array<TISInputSource>
        
        return inputSources.map(InputSource.init(rawValue:))
    }
}
