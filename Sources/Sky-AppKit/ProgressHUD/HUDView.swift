//
//  HUDView.swift
//  ESProgressHUD
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import AppKit
import Sky_Base

internal final class HUDView : NSView {
	
	private(set) weak var owner: ProgressHUD?
	
	private var messageLabel: NSTextField!
	private var progressIndicator: NSProgressIndicator!
	
	var message:String {
		
		get {
			
			messageLabel.stringValue
		}
		
		set {
			
			messageLabel.stringValue = newValue
			updateFrames()
		}
	}
	
	var theme: ProgressHUD.Theme! {
		
		didSet {
			
            apply(theme: theme)
		}
	}
	
	var options: ProgressHUD.Options! {
		
		didSet {
			
            self.apply(options: options)
		}
	}
	
	var styles: ProgressHUD.Styles! {
		
		didSet {
			
            self.apply(styles: styles)
		}
	}
	
	init(frame frameRect: NSRect, owner: ProgressHUD, theme: ProgressHUD.Theme, options: ProgressHUD.Options, styles: ProgressHUD.Styles) {
		
		self.owner = owner
		
		super.init(frame: frameRect)
		
        HUDView.prepare(view: self)
		
		self.theme = theme
		self.options = options
		self.styles = styles
		
        apply(theme: theme)
        apply(options: options)
        apply(styles: styles)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	private func apply(theme: ProgressHUD.Theme) {
		
		messageLabel.textColor = theme.textColor
		layer!.backgroundColor = theme.backgroundColor.cgColor
	}
	
	private func apply(options: ProgressHUD.Options) {
		
		if options.useActivityIndicator {
			
			progressIndicator.startAnimation(self)
		}
		else {
			
			progressIndicator.stopAnimation(self)
		}
	}
	
	private func apply(styles: ProgressHUD.Styles) {
		
		layer!.cornerRadius = styles.radius
		messageLabel.font = styles.font
		
		updateFrames()
	}
	
	private func updateMessageLabelFrame(parentFrame frame: CGRect? = nil) {
		
        let font = messageLabel.font
		let width = messageLabel.bounds.size.width
		
        let size = messageLabel.stringValue.size(with: font, style: nil, maxWidth: width)
		
		messageLabel.frame = messageLabel.frame.replaced(height: size.height)
	}
	
	private func updateFrames(parentFrame frame: CGRect? = nil) {
		
		guard let frame = frame ?? superview?.frame else {
			
			return
		}
		
		updateMessageLabelFrame()
		
        var messageLabelFrame = messageLabel.frame.center(of: frame)
		
		if options.useActivityIndicator {
			
			let halfMargin:CGFloat = 4.0
            var progressIndicatorFrame = progressIndicator.frame.center(of: frame)
			
            progressIndicatorFrame.origin.y += messageLabelFrame.size.height.half.rounded() + halfMargin
			messageLabelFrame.origin.y -= progressIndicatorFrame.size.height.half.rounded() + halfMargin
			
			messageLabel.frame = messageLabelFrame
			progressIndicator.frame = progressIndicatorFrame
		}
		else {
			
			messageLabel.frame = messageLabelFrame
		}
	}
	
	var backgroundColor:NSColor? {
		
		get {
			
			layer!.backgroundColor.flatMap(NSColor.init)
		}
		
		set {
			
            layer?.backgroundColor = newValue?.cgColor
		}
	}
	
	override func layout() {
		
		defer {
			
			super.layout()
		}
		
		updateFrames(parentFrame: frame)
		
		addSubview(messageLabel)
		addSubview(progressIndicator)
	}
}

extension HUDView {
	
	private static func prepare(view: HUDView) {
		
		view.wantsLayer = true
        view.focusRingType = NSFocusRingType.none
		view.layer!.zPosition = 1003
		
        prepareMessageLabel(view: view)
		prepareProgressIndicator(view: view)
	}
	
	private static func prepareMessageLabel(view:HUDView) {
		
		let viewFrame = view.frame
        let labelFrame = view.frame.applying(padding: CGMargin(margin: 8.0)).replaced(height: 50.0).center(of: viewFrame)
		
		view.messageLabel = NSTextField(frame: labelFrame)
		
        view.messageLabel.isEditable = false
        view.messageLabel.isBordered = false
        view.messageLabel.backgroundColor = NSColor.clear
        view.messageLabel.alignment = NSTextAlignment.center
	}
	
	private static func prepareProgressIndicator(view:HUDView) {
		
		let size:CGFloat = 32.0
		let frame = NSRect(x: 0.0, y: 0.0, width: size, height: size)
		
		view.progressIndicator = NSProgressIndicator(frame: frame)
        view.progressIndicator.style = .spinning
        view.progressIndicator.isDisplayedWhenStopped = false
	}
}

extension HUDView {
	
	override func mouseDown(with theEvent: NSEvent) {
		
        super.mouseDown(with: theEvent)
		
        window?.nextEvent(matching: [.leftMouseUp])
	}
	
	override func mouseUp(with theEvent: NSEvent) {
		
        super.mouseUp(with: theEvent)
		
		if !options.keepPopupWhenTouch {
			
			owner?.hideImmediately()
		}
	}
}
