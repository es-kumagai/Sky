//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/19.
//

import Foundation
import ApplicationServices

/// [Sky] The AXUIElement wrapper class.
public final class UIElement {
    
    public let rawElement: AXUIElement
    
    public init(rawElement element: AXUIElement) {
        
        rawElement = element
    }
    
    public convenience init(application pid: pid_t) {
        
        let app = AXUIElementCreateApplication(pid)
        
        self.init(rawElement: app)
    }
    
    public convenience init?(cfType ref: CFTypeRef?) {
        
        guard let ref = ref else {
            
            return nil
        }
        
        self.init(rawElement: ref as! AXUIElement)
    }
    
    @discardableResult
    public func perform(_ action: Action) -> AXError {
        
        return  AXUIElementPerformAction(rawElement, action.axAction)
    }
    
    public var menuRole: UIElement? {
        
        var result = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXMenuRole as CFString, &result)
        
        return UIElement(cfType: result)
    }
    
    public var menuItemRole: UIElement? {
        
        var result = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXMenuItemRole as CFString, &result)
        
        return UIElement(cfType: result)
    }
    
    public var menuBarItemRole: UIElement? {
        
        var result = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXMenuBarItemRole as CFString, &result)
        
        return UIElement(cfType: result)
    }
    
    public var menuBarAttribute: UIElement? {
        
        var result = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXMenuBarAttribute as CFString, &result)
        
        return UIElement(cfType: result)
    }
    
    public var extrasMenuBarAttribute: UIElement? {
        
        var result = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXExtrasMenuBarAttribute as CFString, &result)
        
        return UIElement(cfType: result)
    }
    
    public var menuItemCommandCharacterAttribute: String? {
        
        var result = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXMenuItemCmdCharAttribute as CFString, &result)
        
        return result as? String
    }
    
    public var menuItemCommandGlyphAttribute: String? {
        
        var result = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXMenuItemCmdGlyphAttribute as CFString, &result)
        
        return result as? String
    }
    
    public var children: Array<UIElement> {
        
        var elements = nil as AnyObject?
        
        AXUIElementCopyAttributeValue(rawElement, kAXChildrenAttribute as CFString, &elements)
        
        guard let resultElements = elements as? NSArray else {
            
            return []
        }
        
        return resultElements.map { UIElement(rawElement: $0 as! AXUIElement) }
    }
    
    public var title: String? {
        
        var title = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXTitleAttribute as CFString, &title)
        
        return title as? String
    }
    
    public var description: String? {
        
        var description = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXDescriptionAttribute as CFString, &description)
        
        return description as? String
    }
    
    public var menuItemMarkCharacter: String? {
        
        var mark = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXMenuItemMarkCharAttribute as CFString, &mark)
        
        return mark as? String
    }
    
    public var selected: Bool? {
        
        var selected = nil as CFTypeRef?
        
        AXUIElementCopyAttributeValue(rawElement, kAXSelectedAttribute as CFString, &selected)
        
        return selected as? Bool
    }
    
    public func select() {
        
        AXUIElementSetAttributeValue(rawElement, kAXSelectedAttribute as CFString, true as CFBoolean)
    }
}
