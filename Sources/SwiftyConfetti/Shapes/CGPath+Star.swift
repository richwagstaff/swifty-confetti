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
    /// Creates a star shape.
    /// - Parameters:
    ///   - rect: Draws the star within this rectangle.
    ///   - pointsOnStar: The number of points on the star.
    /// - Returns: A star shape.
    static func star(in rect: CGRect, pointsOnStar: Int = 5) -> CGPath {
        let path = CGMutablePath()

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2

        let angle = CGFloat(2 * Double.pi / Double(pointsOnStar))
        let innerRadius = radius * 0.4

        var isFirstPoint = true

        for i in 0 ..< pointsOnStar {
            let currentAngle = CGFloat(i) * angle - CGFloat(Double.pi / 2)

            let outerPoint = CGPoint(
                x: center.x + radius * cos(currentAngle),
                y: center.y + radius * sin(currentAngle)
            )
            let innerPoint = CGPoint(
                x: center.x + innerRadius * cos(currentAngle + angle / 2),
                y: center.y + innerRadius * sin(currentAngle + angle / 2)
            )

            if isFirstPoint {
                path.move(to: outerPoint)
                path.addLine(to: innerPoint)
                isFirstPoint = false
            }
            else {
                path.addLine(to: outerPoint)
                path.addLine(to: innerPoint)
            }
        }

        return path
    }
}

#endif
