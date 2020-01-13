//
//  CGImage.swift
//  ESCoreGraphicsExtension
//
//  Created by Tomohiro Kumagai on H27/07/31.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import CoreGraphics

extension CGImage {
	
	public func widthScale(of size: CGSize) -> CGScale {
		
        CGFloat(width).scale(of: size.width)
	}
	
	public func heightScale(of size: CGSize) -> CGScale {
		
        CGFloat(height).scale(of: size.height)
	}
}
