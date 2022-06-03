//
//  Operators.swift
//  ESCoreGraphicsExtension
//
//  Created by Tomohiro Kumagai on H27/07/29.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import CoreGraphics
import Swim

extension CGPoint {
	
	public static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		
		let x = lhs.x + rhs.x
		let y = lhs.y + rhs.y
		
		return CGPoint(x: x, y: y)
	}

	public static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		
		let x = lhs.x - rhs.x
		let y = lhs.y - rhs.y
		
		return CGPoint(x: x, y: y)
	}
	
	public static func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		
		let x = lhs.x * rhs.x
		let y = lhs.y * rhs.y
		
		return CGPoint(x: x, y: y)
	}
	
	public static func /(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
		
		let x = lhs.x / rhs.x
		let y = lhs.y / rhs.y
		
		return CGPoint(x: x, y: y)
	}
}

extension CGSize {

	public static func +(lhs: CGSize, _ rhs: CGSize) -> CGSize {
	
		let width = lhs.width + rhs.width
		let height = lhs.height + rhs.height
	
		return CGSize(width: width, height: height)
	}
	
	public static func -(lhs: CGSize, _ rhs: CGSize) -> CGSize {
		
		guard lhs.width >= rhs.width && lhs.height >= rhs.height else {
			
			fatalError()
		}
		
		let width = lhs.width - rhs.width
		let height = lhs.height - rhs.height
		
		return CGSize(width: width, height: height)
	}
	
	public static func *(lhs: CGSize, rhs: CGSize) -> CGSize {
		
		let width = lhs.width * rhs.width
		let height = lhs.height * rhs.height
		
		return CGSize(width: width, height: height)
	}
	
	public static func /(lhs: CGSize, rhs: CGSize) -> CGSize {
		
		let width = lhs.width / rhs.width
		let height = lhs.height / rhs.height
		
		return CGSize(width: width, height: height)
	}
}

