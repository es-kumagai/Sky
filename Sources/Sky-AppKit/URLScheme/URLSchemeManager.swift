//
//  URLSchemeManager.swift
//  CodePiece
//
//  Created by Tomohiro Kumagai on H27/08/12.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Cocoa

/// [Sky] An object type that manage handling URL schemes.
public final class URLSchemeManager {
    
    /// [Sky] An event manager to be used internally.
	internal static var eventManager = NSAppleEventManager.shared()
    
    /// [Sky] The class information to handling events.
    private static let eventClass = AEEventClass(kInternetEventClass)

    /// [Sky] The event ID to handling events.
    private static let eventID = AEEventID(kAEGetURL)
    
    /// [Sky] The URL schemes that handling by this instance.
	public var schemes: Array<URLScheme.Type>
    
    /// [Sky] Creates an instance to managing URL schemes.
    /// - Parameter schemes: The URL schemes to managing.
    public init(schemes: Array<URLScheme.Type>) {
        
        self.schemes = schemes
        Self.setEventHandler(handlingBy: self)
	}
	
	deinit {
		
        Self.removeEventHandler()
	}
}

internal extension URLSchemeManager {
    
    /// [Sky] Set event handler handling by `manager`.
    /// - Parameter manager: The manager that managing event handler.
    static func setEventHandler(handlingBy manager: URLSchemeManager) {
        
        eventManager.setEventHandler(manager, andSelector: #selector(handleURLEvent(event:withReply:)), forEventClass: eventClass, andEventID: eventID)
    }
    
    /// [Sky] Remove event handler.
    static func removeEventHandler() {
        
        eventManager.removeEventHandler(forEventClass: eventClass, andEventID: eventID)
    }
    
    /// [Sky] Invokes when a URL event has been received.
    /// - Parameters:
    ///   - event: The received event.
    ///   - replyEvent: The reply event to fill in.
	@objc func handleURLEvent(event: NSAppleEventDescriptor, withReply replyEvent: NSAppleEventDescriptor) {
		
		guard let url = event.url else {

			NSLog("Invalid URL event=\(event), reply=\(replyEvent). ")
			return
		}

		for scheme in schemes where scheme.matches(url) {
			
			scheme.action(url: url)
		}
	}
}
