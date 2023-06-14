

#if canImport(UIKit)
import UIKit
public struct ConfettiConfig {
    var colors: [UIColor] = ConfettiColor.allCases.map { $0.uiColor }
    var images: [UIImage] = []
    var shapes: [ConfettiShape] = ConfettiShape.allCases
    var intensity: Float = 1

    public init(
        colors: [UIColor] = ConfettiColor.allCases.map { $0.uiColor },
        images: [UIImage] = [],
        shapes: [ConfettiShape] = ConfettiShape.allCases,
        intensity: Float = 1
    ) {
        self.colors = colors
        self.images = images
        self.shapes = shapes
        self.intensity = intensity
    }
}

#endif
