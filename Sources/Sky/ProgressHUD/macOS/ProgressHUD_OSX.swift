//
//  ProgressHUD_OSX.swift
//  ESProgressHUD
//
//  Created by Tomohiro Kumagai on H27/07/31.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import AppKit
import Ocean
import Swim

extension ProgressHUD {
	
    @discardableResult
	public func show(_ message: String? = nil, onView targetView: NSView? = nil, dismissHandler: DismissHandler? = nil) -> Bool {
		
		guard let targetView = targetView ?? ProgressHUD.targetViewInMainWindow else {
			
			return false
		}
		
        let frame = NSRect(x: 0.0, y: 0.0, width: 160.0, height: 160.0).center(of: targetView.frame)
		let hudView = HUDView(frame: frame, owner: self, theme: self.theme, options: options, styles: styles)
		
		hudView.message = message ?? self.message ?? ""
		
        DispatchQueue.main.async {
			
			self.hudView = hudView
			self.dismissHandler = dismissHandler
			
			targetView.addSubview(hudView)
		}
		
		return true
	}
	
	public func hide() {
		
        let count = showingState.decrementActiveCount(requestOwner: self)
		
		if count == 0 {
			
			hideImmediately()
		}
	}

	public func hideImmediately() {
		
		DispatchQueue.main.async {
			
			self.hudView?.removeFromSuperview()
			
			defer {
				
				self.showingState.reset()
				self.hudView = nil
				self.dismissHandler = nil
			}
			
			self.dismissHandler?(self)
		}
	}
}

extension ProgressHUD {
	
	private static var targetViewInMainWindow:NSView? {
		
        let application = NSApplication.shared
		
        if let window = application.keyWindow, window.isVisible {
			
			return window.contentView
		}
		
        if let window = application.mainWindow, window.isVisible {
			
			return window.contentView
		}
		
        if let window = NSApplication.shared.windows.first(where: { $0.isVisible }) {
			
			return window.contentView
		}
		
		return nil
	}
}
