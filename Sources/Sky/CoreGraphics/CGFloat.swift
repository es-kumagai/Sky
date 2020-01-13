//
//  CGFloat.swift
//  ESCoreGraphicsExtension
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 2015 EasyStyle G.K. All rights reserved.
//

import CoreGraphics
import Ocean

// MARK: - Scaleable & Truncateable

extension CGFloat : ScaleType {

    public var value: CGFloat {
        
        self
    }
    
    public init(_ value: CGFloat) {
        
        self = value
    }
}

extension CGFloat : Scalable {

    public func scaled(by scale: CGScale) -> CGFloat {
        
        scale.applying(to: self)
    }
}

extension CGFloat : Truncatable {}
extension CGFloat : Dividable {}

extension CGFloat {

	public func scale(of value: CGFloat) -> CGScale {
        
		CGScale(self / value)
	}
	
}

