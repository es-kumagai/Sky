//
//  CGSize.swift
//  ESCoreGraphicsExtension
//
//  Created by Tomohiro Kumagai on H27/07/31.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import CoreGraphics
import Ocean

// MARK: - Scaleable & Truncateable

extension CGSize : Scalable, Truncatable {
	
	public func scaled(by scale: CGScale) -> CGSize {
		
        guard !scale.meansActualSize else {
			
			return self
		}
		
        let width = self.width.scaled(by: scale)
        let height = self.height.scaled(by: scale)
		
		return CGSize(width: width, height: height)
	}
	
	public func rounded() -> CGSize {
		
		CGSize(width: width.rounded(), height: height.rounded())
	}
}

extension CGSize {
	
	public func widthScale(of size: CGSize) -> CGScale {
		
        width.scale(of: size.width)
	}
	
	public func heightScale(of size: CGSize) -> CGScale {
		
        height.scale(of: size.height)
	}
}
