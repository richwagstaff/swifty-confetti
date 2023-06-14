#if canImport(UIKit)
import UIKit
public struct ConfettiConfig {
    var colors: [UIColor] = ConfettiColor.allCases.map { $0.uiColor }
    var images: [UIImage] = []
    var shapes: [ConfettiShape] = ConfettiShape.allCases

    public init(
        colors: [UIColor] = ConfettiColor.allCases.map { $0.uiColor },
        images: [UIImage] = [],
        shapes: [ConfettiShape] = ConfettiShape.allCases
    ) {
        self.colors = colors
        self.images = images
        self.shapes = shapes
    }
}

#endif
