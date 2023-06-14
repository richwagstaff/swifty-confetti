//
//  File.swift
//
//
//  Created by Richard Wagstaff on 14/06/2023.
//

import Foundation

#if canImport(UIKit)
import UIKit

public extension CGPath {
    /// Creates a triangle cg path.
    /// - Parameter rect: The rect.
    static func triangle(in rect: CGRect) -> CGPath {
        let path = CGMutablePath()
        path.addLines(between: [
            CGPoint(x: rect.midX, y: rect.minY),
            CGPoint(x: rect.maxX, y: rect.maxY),
            CGPoint(x: rect.minX, y: rect.maxY),
        ])
        return path
    }
}
#endif
