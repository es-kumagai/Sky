//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/20.
//

import Carbon

open class InputMethod {
    
    public init() {
        
    }
    
    open var inputSources: Array<InputSource> {
        
        findInputSources(withProperties: nil, includeAllInstalled: false)
    }
    
    public func findInputSources(includeAllInstalled: Bool) -> Array<InputSource> {
        
        findInputSources(withProperties: nil, includeAllInstalled: includeAllInstalled)
    }

    public func findInputSources(havingInputSourceID inputSourceID: String, includeAllInstalled: Bool) -> Array<InputSource> {
        
        let properties = [kTISPropertyInputSourceID : inputSourceID]
        
        return findInputSources(withProperties: properties as CFDictionary, includeAllInstalled: includeAllInstalled)
    }

    public func findInputSources(havingLocalizedName localizedName: String, includeAllInstalled: Bool) -> Array<InputSource> {
        
        let properties = [kTISPropertyLocalizedName : localizedName]
        
        return findInputSources(withProperties: properties as CFDictionary, includeAllInstalled: includeAllInstalled)
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
    
    func findInputSources(withProperties properties: CFDictionary!, includeAllInstalled: Bool) -> Array<InputSource> {
        
        guard let list = TISCreateInputSourceList(properties, includeAllInstalled) else {
        
            return []
        }
        
        let inputSources = list.takeRetainedValue() as! Array<TISInputSource>
        
        return inputSources.map(InputSource.init(rawValue:))
    }
}
