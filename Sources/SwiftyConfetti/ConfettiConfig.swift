

#if canImport(UIKit)
import UIKit
public struct ConfettiConfig {
    var colors: [UIColor] = ConfettiColor.allCases.map { $0.uiColor }
    var images: [UIImage] = []
    var shapes: [ConfettiShape] = ConfettiShape.allCases
    var intensity: Float = 1
}

#endif
