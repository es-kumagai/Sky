//
//  CGPoint.swift
//  ESCoreGraphicsExtension
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import CoreGraphics
import Ocean

// MARK: - Scaleable & Truncateable

extension CGPoint : @retroactive Scalable, Truncatable {
	
	public func scaled(by scale: CGScale) -> CGPoint {
		
        guard !scale.meansActualSize else {
			
			return self
		}
		
        let x = self.x.scaled(by: scale)
        let y = self.y.scaled(by: scale)
		
		return CGPoint(x: x, y: y)
	}
	
	public func rounded() -> CGPoint {
		
        return CGPoint(x: x.rounded(), y: y.rounded())
	}
}

