//
//  File.swift
//  
//
//  Created by Tomohiro Kumagai on 2021/06/19.
//

import Foundation

public extension UIElement {
    
    enum Action {
        
        case raise
        case confirm
        case pick
        case press
        case cancel
        case decrement
        case increment
        case showMenu
    }
}

public extension UIElement.Action {

    var axAction: CFString {
        
        switch self {
        
        case .raise:
            return kAXRaiseAction as CFString
            
        case .confirm:
            return kAXConfirmAction as CFString
            
        case .pick:
            return kAXPickAction as CFString
            
        case .press:
            return kAXPressAction as CFString
            
        case .cancel:
            return kAXCancelAction as CFString
            
        case .decrement:
            return kAXDecrementAction as CFString
            
        case .increment:
            return kAXIncrementAction as CFString
            
        case .showMenu:
            return kAXShowMenuAction as CFString
        }
    }
}
