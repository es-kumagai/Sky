//
//  Theme.swift
//  ESProgressHUD
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import AppKit

extension ProgressHUD {
	
	public struct Theme {
		
		public var textColor: NSColor
		public var backgroundColor: NSColor
		
		init(textColor: NSColor, backgroundColor: NSColor) {
			
			self.textColor = textColor
			self.backgroundColor = backgroundColor
		}
	}
}
