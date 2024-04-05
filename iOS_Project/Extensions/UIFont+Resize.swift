//
//  UIFont+Resize.swift
//  iOS_Project
//
//  Created by Tomeu Garcia Pinto on 5/4/24.
//

import Foundation
import UIKit

extension UIFont {
    
    static func sizeByStyle(_ style: TextStyle) -> CGFloat {
        return UIFont.preferredFont(forTextStyle: style).pointSize
    }
    
    static func fontByStyle(_ style: TextStyle) -> UIFont {
        
        let size = sizeByStyle(style)
        
        switch(style)
        {
        case .largeTitle:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .title1:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .title2:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .title3:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .headline:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .subheadline:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .body:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .callout:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .footnote:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .caption1:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        case .caption2:
            return UIFont(name: "FontName", size: size) ?? UIFont.preferredFont(forTextStyle: style)
        default:
            return UIFont.preferredFont(forTextStyle: style)
        }
    }
    
}
