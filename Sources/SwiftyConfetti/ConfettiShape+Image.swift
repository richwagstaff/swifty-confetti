
import Foundation

#if canImport(CoreGraphics) && canImport(UIKit)
import CoreGraphics
import UIKit

public extension ConfettiShape {
    /// Creates a UIImage of the shape.
    /// - Parameters:
    ///   - size: The size of the image.
    ///   - color: The color.
    /// - Returns: A UIImage of the shape.
    func image(size: CGSize, color: UIColor) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let path = path(in: CGRect(origin: .zero, size: size))
        return renderer.image { context in
            context.cgContext.setFillColor(color.cgColor)
            context.cgContext.addPath(path)
            context.cgContext.drawPath(using: .fill)
        }
    }

    /// The path of the shape within the given bounds.
    /// - Parameter bounds: The maximum bounds.
    /// - Returns: The path.
    func path(in rect: CGRect) -> CGPath {
        let dimension = min(rect.width, rect.height)
        switch self {
        case .rectangle:
            return CGPath(
                rect: CGRect(x: 0, y: 0, width: dimension, height: dimension * 5 / 8),
                transform: nil
            )
        case .circle:
            return CGPath(
                ellipseIn: CGRect(x: 0, y: 0, width: dimension * 0.8, height: dimension * 0.8),
                transform: nil
            )
        case .triangle:
            return .triangle(in: rect)
        case .arc:
            return .arc(in: rect)
        case .star:
            return .star(in: rect)
        }
    }
}

#endif
