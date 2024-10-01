//
//  HUD.swift
//  ESProgressHUD
//
//  Created by Tomohiro Kumagai on H27/08/02.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public typealias DismissHandler = (ProgressHUD) -> Void

@MainActor
public protocol HUDImplementation : AnyObject {
	
	associatedtype View
	
	var shown: Bool { get }

    @discardableResult
	func show(_ message: String?, onView targetView: View?, dismissHandler: DismissHandler?) -> Bool

    func hide()
	
    func hideImmediately()
}

