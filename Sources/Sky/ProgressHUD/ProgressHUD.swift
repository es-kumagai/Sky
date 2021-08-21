//
//  ProgressHUD.swift
//  ESProgressHUD
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import AppKit
import Ocean

public final class ProgressHUD : HUDImplementation {

	internal weak var hudView: HUDView?
	internal var dismissHandler: DismissHandler?
	
	internal var showingState: ActiveCounter

	public var message: String?
	
	public var theme: Theme
	public var options: Options
	public var styles: Styles
	
	public init(message: String?, theme: Theme, options: Options? = nil, styles: Styles? = nil) {

		self.showingState = ActiveCounter()
		
		self.message = message
		
		self.theme = theme
		self.options = options ?? Options()
		self.styles = styles ?? Styles()
	}
}

extension ProgressHUD {
	
	public var shown: Bool {
		
        return showingState.isActive
	}
	
	public convenience init(message: String? = nil, useActivityIndicator: Bool = false) {
		
		var options = Options()
		
		options.useActivityIndicator = useActivityIndicator
		
        self.init(message: message, theme: .basic, options: options)
	}
}
