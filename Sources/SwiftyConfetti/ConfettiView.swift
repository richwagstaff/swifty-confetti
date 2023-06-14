//
//  ConfettiView.swift
//  Crossword
//
//  Created by Richard Wagstaff on 06/11/2019.
//  Copyright © 2019 Richard Wagstaff. All rights reserved.
//

#if canImport(UIKit) && canImport(QuartzCore)

import QuartzCore
import UIKit

public class ConfettiView: UIView {
    public var colors: [UIColor] = ConfettiColor.allCases.map { $0.uiColor }
    public var images: [UIImage] = []
    public var shapes: [ConfettiShape] = ConfettiShape.allCases
    public var intensity: Float = 1

    public var emitterWidthMultiplier: CGFloat = 0.9

    var isEmitting: Bool {
        emitter.birthRate != 0
    }

    lazy var emitter: CAEmitterLayer = {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: bounds.midX, y: 0)
        emitter.emitterSize = CGSize(width: bounds.size.width, height: 1)
        emitter.emitterShape = .rectangle
        emitter.frame = bounds
        return emitter
    }()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }

    private func sharedInit() {
        emitter.birthRate = 0
        reloadEmitter()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        emitter.frame = bounds
        emitter.emitterPosition = CGPoint(x: bounds.midX, y: -500)
        emitter.emitterSize = CGSize(width: bounds.size.width, height: 500)
    }

    private func reloadEmitter() {
        emitter = CAEmitterLayer()

        emitter.emitterPosition = CGPoint(x: frame.size.width / 2.0, y: 0)
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterSize = CGSize(width: frame.size.width, height: 1)

        emitter.emitterCells = ConfettiCellGenerator.cells(
            images: images,
            shapes: shapes,
            colors: colors,
            intensity: intensity
        )

        layer.addSublayer(emitter)
        // active = true
    }

    public func start(rate: Float = 1, delay: TimeInterval = 0, stopAfter: TimeInterval? = 10) {
        stop()

        DispatchQueue.main.asyncAfter(deadline: .now()+delay) {
            if self.emitter.superlayer == nil {
                self.layer.addSublayer(self.emitter)
            }

            self.emitter.birthRate = rate
        }

        if let stopAfter = stopAfter {
            DispatchQueue.main.asyncAfter(deadline: .now()+stopAfter+delay) {
                self.emitter.birthRate = 0
            }
        }
    }

    public func stop() {
        emitter.birthRate = 0
    }
}

#endif
