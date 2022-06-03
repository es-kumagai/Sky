//
//  ReplaceValues.swift
//  ESCoreGraphicsExtension
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import CoreGraphics

extension CGPoint {
	
	public func replaced(x: CGFloat) -> CGPoint {
		
		return CGPoint(x: x, y: self.y)
	}
	
	public func replaced(y: CGFloat) -> CGPoint {
		
		return CGPoint(x: self.x, y: y)
	}
}

extension CGSize {
		
	public func replaced(width: CGFloat) -> CGSize {
		
		return CGSize(width: width, height: self.height)
	}
	
	public func replaced(height: CGFloat) -> CGSize {
		
		return CGSize(width: self.width, height: height)
	}
}

extension CGRect {
	
	public func replaced(x: CGFloat) -> CGRect {
		
		return self.replaced(origin: self.origin.replaced(x: x))
	}
	
	public func replaced(y: CGFloat) -> CGRect {
		
		return self.replaced(origin: self.origin.replaced(y: y))
	}
	
	public func replaced(width: CGFloat) -> CGRect {
		
		return self.replaced(size: self.size.replaced(width: width))
	}
	
	public func replaced(height: CGFloat) -> CGRect {
		
		return self.replaced(size: self.size.replaced(height: height))
	}
	
	public func replaced(origin: CGPoint) -> CGRect {
		
		return CGRect(origin: origin, size: self.size)
	}
	
	public func replaced(size: CGSize) -> CGRect {
		
		return CGRect(origin: self.origin, size: size)
	}
}
