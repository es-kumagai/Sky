//
//  Theme_OSX.swift
//  ESProgressHUD
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import AppKit

extension ProgressHUD.Theme {
    
    nonisolated(unsafe)
    public static let basic: ProgressHUD.Theme = ProgressHUD.Theme(textColor: NSColor.black, backgroundColor: NSColor(white: 0.8, alpha: 0.90))
}
