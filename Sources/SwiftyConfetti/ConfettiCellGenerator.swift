//
//  File.swift
//
//
//  Created by Richard Wagstaff on 13/06/2023.
//

#if canImport(UIKit) && canImport(QuartzCore) && canImport(CoreGraphics)
import QuartzCore
import UIKit

enum ConfettiCellGenerator {
    static func cells(
        images: [UIImage],
        shapes: [ConfettiShape],
        colors: [UIColor],
        intensity: Float
    ) -> [CAEmitterCell] {
        var cells: [CAEmitterCell] = []

        for shape in shapes {
            for color in colors {
                let image = shape.image(
                    size: CGSize(width: 32, height: 32),
                    color: color
                )
                guard let cgImage = image.cgImage else { continue }

                let cell = createCell(
                    contents: cgImage,
                    intensity: intensity
                )
                cells.append(cell)
            }
        }

        for image in images {
            guard let cgImage = image.cgImage else { continue }
            let cell = createCell(
                contents: cgImage,
                intensity: intensity
            )
            cells.append(cell)
        }

        return cells
    }

    static func createCell(
        contents: CGImage,
        intensity: Float
    ) -> CAEmitterCell {
        let cell = CAEmitterCell()

        cell.beginTime = CACurrentMediaTime()
        cell.birthRate = 14 * intensity
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
