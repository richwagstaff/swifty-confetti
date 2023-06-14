
#if canImport(UIKit) && canImport(QuartzCore) && canImport(CoreGraphics)
import QuartzCore
import UIKit

open class ConfettiGenerator {
    public var config: ConfettiConfig

    public init(config: ConfettiConfig) {
        self.config = config
    }

    /// Generates an array of confetti emitter cells.
    /// - Returns: Array of emitter cells
    open func generateCells() -> [CAEmitterCell] {
        var cells: [CAEmitterCell] = []

        for shape in config.shapes {
            for color in config.colors {
                let image = shape.image(
                    size: CGSize(width: 32, height: 32),
                    color: color
                )
                guard let cgImage = image.cgImage else { continue }
                let cell = generateCell(contents: cgImage)
                cells.append(cell)
            }
        }

        for image in config.images {
            guard let cgImage = image.cgImage else { continue }
            let cell = generateCell(contents: cgImage)
            cells.append(cell)
        }

        return cells
    }

    /// Create the cell for the content.
    /// - Parameter contents: The contents.
    /// - Returns: The emitter cell.
    open func generateCell(
        contents: CGImage
    ) -> CAEmitterCell {
        let cell = CAEmitterCell()

        cell.beginTime = CACurrentMediaTime()
        cell.birthRate = 14 * config.intensity
        cell.contents = contents
        cell.emissionRange = .pi
        cell.lifetime = 14
        cell.spin = 4
        cell.spinRange = 8
        cell.velocity = 300
        cell.velocityRange = 100
        cell.yAcceleration = 150
        cell.scale = 1 / UIScreen.main.scale
        cell.scaleRange = 0.3

        cell.setValue("plane", forKey: "particleType")
        cell.setValue(Double.pi, forKey: "orientationRange")
        cell.setValue(Double.pi / 2, forKey: "orientationLongitude")
        cell.setValue(Double.pi / 2, forKey: "orientationLatitude")

        return cell
    }
}

#endif
