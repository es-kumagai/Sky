//
//  Flip.swift
//  ESCoreGraphicsExtension
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 2015 EasyStyle G.K. All rights reserved.
//

import CoreGraphics

extension CGRect {
	
    /// Returns the rect flipped on Y axis.
    ///
    /// - Parameter height: maximum height of canvas.
	public func flipped(height: CGFloat) -> CGRect {
		
		let newOrigin = origin.flipped(height: height - self.height)

        return CGRect(origin: newOrigin, size: size)
	}
}

extension CGPoint {
    
    /// Returns the point flipped on Y axis.
    ///
    /// - Parameter height: maximum height of canvas.
	public func flipped(height: CGFloat) -> CGPoint {
		
		CGPoint(x: x, y: height - y)
	}
}
