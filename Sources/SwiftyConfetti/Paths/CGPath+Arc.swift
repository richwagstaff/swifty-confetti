
import Foundation

#if canImport(UIKit)
import UIKit

extension CGPath {
    /// Creates an arc shape.
    /// - Parameter bounds: The bounds.
    /// - Returns: The arc shape.
    public static func arc(
        in rect: CGRect,
        startAngle: CGFloat = .pi * 0.1,
        endAngle: CGFloat = .pi * 1.5,
        thickness: CGFloat = 0.38
    ) -> CGPath {
        let path = CGMutablePath()

        let center: CGPoint = .zero
        let outerRadius: CGFloat = 12
        let innerRadius: CGFloat = outerRadius * (1 - thickness)

        // Create first arc
        path.addArc(center: center, radius: innerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        // Create arc 2
        path.addArc(center: center, radius: outerRadius, startAngle: endAngle, endAngle: startAngle, clockwise: false)

        path.closeSubpath()

        let pathBounds = path.boundingBox
        let multiplier = min(rect.width / pathBounds.width, rect.height / pathBounds.height)

        var translation = CGAffineTransformMakeTranslation(-pathBounds.minX, -pathBounds.minY)
        var scale = CGAffineTransformMakeScale(multiplier, multiplier)

        return path.copy(using: &translation)?.copy(using: &scale) ?? path
    }

    internal func arcPoint(
        center: CGPoint,
        radius: CGFloat,
        angle: CGFloat
    ) -> CGPoint {
        CGPoint(
            x: center.x + radius * cos(angle),
            y: center.y + radius * sin(angle)
        )
    }
}
#endif
