//
//  CGRect.swift
//  ESCoreGraphicsExtension
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 2015 EasyStyle G.K. All rights reserved.
//

import CoreGraphics
import Ocean

// MARK: - Calculate

extension CGRect {
	
	public func applying(margin: Margin<CGFloat>) -> CGRect {
		
		let origin = self.origin - CGPoint(x: margin.left, y: margin.top)
		let size = self.size + CGSize(width: margin.horizontalTotal, height: margin.verticalTotal)
		
		return CGRect(origin: origin, size: size)
	}
	
	public func applying(padding: Margin<CGFloat>) -> CGRect {
		
		let origin = self.origin + CGPoint(x: padding.left, y: padding.top)
		let size = self.size - CGSize(width: padding.horizontalTotal, height: padding.verticalTotal)
		
		return CGRect(origin: origin, size: size)
	}
	
	public func center(of rect: CGRect, truncate: Bool = false) -> CGRect {
		
		let x = (rect.width - self.width) / 2
		let y = (rect.height - self.height) / 2
		
		let origin = CGPoint(x: x, y: y)
		
        return replaced(origin: truncate ? origin.rounded() : origin)
	}
}

// MARK: - Scaleable & Truncateable

extension CGRect : Scalable, Truncatable {
	
	public func scaled(by scale: CGScale) -> CGRect {
		
        guard !scale.meansActualSize else {
			
			return self
		}
		
		return CGRect(origin: origin.scaled(by: scale), size: size.scaled(by: scale))
	}
	
	public func rounded() -> CGRect {
		
		CGRect(origin: origin.rounded(), size: size.rounded())
	}
}

extension CGRect {
	
	public func widthScale(of rect: CGRect) -> CGScale {
		
        size.widthScale(of: rect.size)
	}
	
	public func heightScale(of rect: CGRect) -> CGScale {
		
        size.heightScale(of: rect.size)
	}
}
