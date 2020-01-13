//
//  Font.swift
//  Ocean
//
//  Created by Tomohiro Kumagai on 2020/01/14.
//

import AppKit

extension String {
    
    public func size(with font: NSFont?, lineBreakMode: NSLineBreakMode, maxWidth: CGFloat? = nil) -> NSSize {
        
        let style = NSMutableParagraphStyle()
        
        style.lineBreakMode = lineBreakMode
        
        return size(with: font, style: style, maxWidth: maxWidth)
    }
    
    public func size(with font: NSFont?, style: NSMutableParagraphStyle?, maxWidth: CGFloat? = nil) -> NSSize {

        var attributes = [NSAttributedString.Key : Any]()

        if let font = font {
            
            attributes[.font] = font
        }
        
        if let style = style {
            
            attributes[.paragraphStyle] = style
        }
        
        
        if let width = maxWidth {
            
            let size = CGSize(width: width, height: 0.0)
            
            return NSAttributedString(string: self, attributes: attributes).boundingRect(with: size, options: .usesLineFragmentOrigin).size
        }
        else {
            
            let size = CGSize.zero
            
            return NSAttributedString(string: self, attributes: attributes).boundingRect(with: size, options: NSString.DrawingOptions(rawValue: 0)).size
        }
    }
}

