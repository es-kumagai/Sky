//
//  URLSchemeManager.swift
//  CodePiece
//
//  Created by Tomohiro Kumagai on H27/08/12.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Cocoa

/// [Sky] An object type that manage handling URL schemes.
@objc(ESURLSchemeManager) public final class URLSchemeManager: NSObject {
    
    /// [Sky] An event manager to be used internally.
    nonisolated(unsafe)
	internal static var eventManager = NSAppleEventManager.shared()
    
    /// [Sky] The class information to handling events.
    private static let eventClass = AEEventClass(kInternetEventClass)

    /// [Sky] The event ID to handling events.
    private static let eventID = AEEventID(kAEGetURL)
    
    /// [Sky] The URL schemes that handling by this instance.
	public var schemes: Array<URLScheme.Type>
    
    /// [Sky] The delegate to customizing behaviors.
    public var delegate: URLSchemeManagerDelegate? = nil
    
    /// [Sky] Whether the handling process is in progress.
    public internal(set) var handlingProcessInProgress: Bool
    
    /// [Sky] Creates an instance to managing URL schemes.
    /// - Parameter schemes: The URL schemes to managing.
    public init(schemes: Array<URLScheme.Type>) {
        
        self.schemes = schemes
        self.handlingProcessInProgress = false
        
        super.init()
        
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
        
        handlingProcessInProgress = true
        delegate?.urlSchemeManager?(self, someURLSchemeDetected: url)

        var matchesCount = 0
        
		for scheme in schemes where scheme.matches(url) {
		
            matchesCount += 1

            do {

                try scheme.action(url: url)
            
                delegate?.urlSchemeManager?(self, schemeDidHandle: scheme, errorIfOccurs: nil)
            }
            catch {
                
                delegate?.urlSchemeManager?(self, schemeDidHandle: scheme, errorIfOccurs: error)
            }
		}

        handlingProcessInProgress = false
        delegate?.urlSchemeManager?(self, handlingDidFinishWithMatchingCount: matchesCount)
	}
}
